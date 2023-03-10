package com.hivemindtechnologies.hays.pfr

import cats.*
import cats.effect.IO
import cats.effect.kernel.Resource
import cats.syntax.all.*
import com.exacttarget.fuelsdk.*
import com.exacttarget.fuelsdk.ETResult.Status.OK

import scala.util.chaining.*

trait MarketingCloudClient:
  def send(bp: Request): IO[Unit]

// see https://github.com/salesforce-marketingcloud/FuelSDK-Java
// see https://github.com/salesforce-marketingcloud/FuelSDK-Java/blob/v1.6.0/src/main/resources/fuelsdk.properties.template
// see https://github.com/salesforce-marketingcloud/FuelSDK-Java/blob/v1.6.0/src/test/java/com/exacttarget/fuelsdk/ETDataExtensionTest.java
// see http://salesforce-marketingcloud.github.io/FuelSDK-Java/

final class DefaultMarketingCloudClient private (config: AppConfig, clientIO: IO[ETClient])(using Log) extends MarketingCloudClient:
  def send(request: Request): IO[Unit] =
    for
      client    <- clientIO
      extension <- extensionIO
      newRow    <- rowFor(request)
      response  <- IO.blocking(extension.insert(newRow))
      _         <- IO.raiseUnless(response.getStatus == OK)(
                     Exception(show"Could not insert row: ${response.getResponseCode} - ${response.getResponseMessage}")
                   )
    yield ()

  def extensionIO: IO[ETDataExtension] =
    for
      client   <- clientIO
      response <- IO.blocking(client.retrieve(classOf[ETDataExtension], show"id=${config.dataExtensionID}"))
      _        <- IO.raiseUnless(response.getStatus == OK)(
                    Exception(show"Could not get data extension '${config.dataExtensionID}': ${response.getResponseCode} - ${response.getResponseMessage}")
                  )
    yield response.getObject

  def rowFor(req: Request): IO[ETDataExtensionRow] = IO {
    val tuples = req.productElementNames.toList.zip(Column.valuesOf(req))

    ETDataExtensionRow().tap { row =>
      tuples.foreach((name, value) => row.setColumn(name, value))
      row.setColumn("subscriberKey", show"${req.bpID}_BP_DE")
    }
  }

object DefaultMarketingCloudClient:
  def from(config: AppConfig)(using Log): Resource[IO, MarketingCloudClient] =
    val newClient = 
      for
        settings <- Setting.allOf(config.marketingCloud).foldLeft(IO(ETConfiguration()))((accu, f) => f(accu))
        client   <- IO.blocking(ETClient(settings))
      yield client

    for client <- Resource.make(newClient)(_ => IO.unit)
    yield DefaultMarketingCloudClient(config, IO(client))
