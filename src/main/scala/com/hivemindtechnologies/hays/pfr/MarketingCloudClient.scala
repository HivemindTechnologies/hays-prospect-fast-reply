package com.hivemindtechnologies.hays.pfr

import cats.*
import cats.effect.IO
import cats.effect.kernel.Resource
import cats.effect.std.AtomicCell
import cats.syntax.all.*
import io.circe.syntax.*
import org.http4s.MediaType
import org.http4s.Credentials.Token
import org.http4s.Method.{GET, POST}
import org.http4s.circe.CirceEntityDecoder.*
import org.http4s.circe.CirceEntityEncoder.*
import org.http4s.client.Client
import org.http4s.client.dsl.io.*
import org.http4s.client.middleware.{Retry, RetryPolicy}
import org.http4s.headers.{Accept, Authorization}
import org.typelevel.ci.*

import scala.util.chaining.*

import JSON.given
import org.http4s.AuthScheme.Bearer

trait MarketingCloudClient:
  def send(bp: Request): IO[Unit]

class DefaultMarketingCloudClient(config: AppConfig, client: Client[IO], cachedAuthentication: AtomicCell[IO, Option[ExpiringAuthentication]])(using Log)
    extends MarketingCloudClient:

  import DefaultMarketingCloudClient.*

  val http = Retry(retryPolicy)(client)
  val from = From(config.senderEmail, config.senderName)

  def send(request: Request): IO[Unit] =
    val payload = SendEmail(
      from,
      To(
        request.address,
        request.subscriberKey,
        Contact(subscriberAttributes =
          Subscriber(
            bpID = request.bpID,
            bpFirstName = request.bpFirstName,
            bpLastName = request.bpLastName,
            bpLanguage = request.bpLanguage,
            bpCountry = request.bpCountry,
            prospectID = request.prospectID,
            prospectNo = request.prospectNo,
            requestID = request.requestID,
            distributionChannel = request.distributionChannel,
            prospectBeginn = request.prospectBeginn,
            prospectDuration = request.prospectDuration.toString,
            prospectTask = request.prospectTask,
            prospectDescription = request.prospectDescription
          )
        )
      )
    )

    ???

  def authentication: IO[ExpiringAuthentication] = cachedAuthentication.evalModify { cached =>
    for
      now    <- IO.realTimeInstant
      current = cached.filter(_.expiration.isAfter(now))
      valid  <- current.fold(freshAuthentication)(IO.pure)
    yield Some(valid) -> valid
  }

  def freshAuthentication: IO[ExpiringAuthentication] =
    for
      authenticated <- authenticate
      now           <- IO.realTimeInstant
    yield ExpiringAuthentication(Authorization(Token(Bearer, authenticated.accessToken)), now.plusSeconds(authenticated.expiresIn))

  // see https://developer.salesforce.com/docs/marketing/marketing-cloud/guide/access-token-s2s.html
  def authenticate: IO[AuthenticationResponse] =
    http.expect[AuthenticationResponse](
      POST(config.marketingCloud.authEndpoint / "v2" / "token", acceptJSON)
        .withEntity(
          AuthenticationRequest("client_credentials", config.marketingCloud.clientID, config.marketingCloud.clientSecret, config.marketingCloud.accountID)
        )
    )

  def retryPolicy = RetryPolicy[IO](RetryPolicy.exponentialBackoff(config.marketingCloud.httpMaxRetryWait, config.marketingCloud.httpMaxRetries))

object DefaultMarketingCloudClient:
  def from(config: AppConfig, client: Client[IO])(using Log): IO[DefaultMarketingCloudClient] =
    for ref <- AtomicCell[IO].of(Option.empty[ExpiringAuthentication])
    yield DefaultMarketingCloudClient(config, client, ref)

  val acceptJSON = Accept(MediaType.application.json)
