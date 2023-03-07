package com.hivemindtechnologies.hays.pfr

import cats.Show
import cats.derived.*
import io.circe.Codec

import java.time.Instant
import java.util.UUID

final case class Request(
  bpID: UUID,
  bpFirstName: String,
  bpLastName: String,
  bpLanguage: String,
  email: String,
  prospectID: String,
  prospectNo: String,
  requestID: UUID,
  distributionChannel: String,
  prospectBeginn: Instant,
  prospectDuration: Double,
  prospectTask: String,
  prospectDescription: String,
  subscriberKey: String
) derives Codec.AsObject, Show, CanEqual

object Request:
  given Show[Instant] = Show.fromToString


