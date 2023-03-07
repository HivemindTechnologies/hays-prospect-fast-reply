package com.hivemindtechnologies.hays.pfr

import cats.syntax.all.*
import cats.effect.IO

trait MarketingCloudClient:
  def send(bp: Request): IO[Unit]

final class DefaultMarketingCloudClient(using Log) extends MarketingCloudClient:
  def send(bp: Request): IO[Unit] = log.info(show"Sending: $bp")
