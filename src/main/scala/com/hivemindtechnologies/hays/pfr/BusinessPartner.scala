package com.hivemindtechnologies.hays.pfr

import cats.Show
import cats.derived.*
import io.circe.Codec

final case class BusinessPartner(id: String) derives Codec.AsObject, Show, CanEqual
