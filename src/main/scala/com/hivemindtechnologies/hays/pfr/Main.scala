package com.hivemindtechnologies.hays.pfr

import cats.effect.{IO, IOApp}
import cats.syntax.all.*
import fs2.Stream
import org.typelevel.log4cats.slf4j.Slf4jLogger
import pureconfig.ConfigSource
import pureconfig.module.catseffect.syntax.*

import scala.concurrent.duration.*
import scala.util.chaining.*
import cats.effect.kernel.Resource

object Main extends IOApp.Simple:
  override def run: IO[Unit] =
    for 
      given Log <- logger
      config    <- configFX
      _         <- log.info(show"Service started")
      _         <- log.debug(config.show)
      client     = DefaultMarketingCloudClient.from(config)
      nothing   <- client.use(Service(config, _).dataflow.logErrorAndRestart.compile.drain)
    yield nothing

  def logger = Slf4jLogger.create[IO]

  def configFX = ConfigSource.default.at("app").loadF[IO, AppConfig]()