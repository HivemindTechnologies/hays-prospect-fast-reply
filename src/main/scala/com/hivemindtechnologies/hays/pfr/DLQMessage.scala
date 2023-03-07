package com.hivemindtechnologies.hays.pfr

import cats.Show
import cats.derived.*
import io.circe.Codec

import java.time.Instant
import java.util.UUID

final case class DLQMessage(message: String, originalPayload: String) derives Codec.AsObject, Show, CanEqual