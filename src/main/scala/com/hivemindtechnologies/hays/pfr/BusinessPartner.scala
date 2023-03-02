package com.hivemindtechnologies.hays.pfr

import cats.Show
import cats.derived.*
import io.circe.Decoder

final case class BusinessPartner(id: String) derives Decoder, Show, CanEqual
