package com.hivemindtechnologies.hays.pfr

import cats.Show
import cats.derived.*
import io.circe.Codec
import io.circe.derivation.{Configuration, ConfiguredCodec}
import org.http4s.headers.Authorization
import org.typelevel.cats.time.*

import java.time.Instant
import java.util.UUID

final case class AuthenticationRequest(grantType: "client_credentials", clientID: String, clientSecret: String, accountID: String) derives Show, CanEqual
final case class AuthenticationResponse(accessToken: String, expiresIn: Int) derives Show, CanEqual

final case class ExpiringAuthentication(header: Authorization, expiration: Instant) derives Show, CanEqual

final case class SendEmail(from: From, to: To) derives Show, CanEqual
final case class From(address: String, name: String) derives Show, CanEqual
final case class To(address: String, subscriberKey: String, contactAttributes: Contact) derives Show, CanEqual
final case class Contact(subscriberAttributes: Subscriber) derives Show, CanEqual
final case class Subscriber(
  bpID: UUID,
  bpFirstName: String,
  bpLastName: String,
  bpLanguage: String,
  bpCountry: String,
  prospectID: String,
  prospectNo: String,
  requestID: UUID,
  distributionChannel: String,
  prospectBeginn: String,
  prospectDuration: String,
  prospectTask: String,
  prospectDescription: String
) derives Show, CanEqual

final case class Request(
  bpID: UUID,
  bpFirstName: String,
  bpLastName: String,
  bpLanguage: String,
  bpCountry: String,
  address: String,
  prospectID: String,
  prospectNo: String,
  requestID: UUID,
  distributionChannel: String,
  prospectBeginn: String,
  prospectDuration: Double,
  prospectTask: String,
  prospectDescription: String
) derives Show, CanEqual:
  def subscriberKey = s"${bpID}_BP_DE"

final case class DLQMessage(message: String, originalPayload: String) derives Show, CanEqual

object JSON:
  given Codec[AuthenticationRequest] = ConfiguredCodec.derived(using snakeCase)
  given Codec[AuthenticationResponse] = ConfiguredCodec.derived(using snakeCase)

  given Codec[SendEmail] = ConfiguredCodec.derived(using pascalCase)
  given Codec[From] = ConfiguredCodec.derived(using pascalCase)
  given Codec[To] = ConfiguredCodec.derived(using pascalCase)
  given Codec[Contact] = ConfiguredCodec.derived(using pascalCase)
  given Codec[Subscriber] = Codec.AsObject.derived

  given Codec[Request] = Codec.AsObject.derived
  given Codec[DLQMessage] = Codec.AsObject.derived

  val pascalCase = Configuration.default.withPascalCaseMemberNames
  val snakeCase = Configuration.default.withSnakeCaseMemberNames

