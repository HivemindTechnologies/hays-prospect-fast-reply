package com.hivemindtechnologies.hays.pfr

import cats.syntax.all.*
import cats.effect.IO

trait MarketingCloudClient:
  def send(bp: BusinessPartner): IO[Unit]

final class DefaultMarketingCloudClient(using Log) extends MarketingCloudClient:
  def send(bp: BusinessPartner): IO[Unit] = log.info(show"Sending: $bp")
