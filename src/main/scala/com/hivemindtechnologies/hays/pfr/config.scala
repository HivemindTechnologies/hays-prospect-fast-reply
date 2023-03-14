package com.hivemindtechnologies.hays.pfr

import cats.Show
import cats.derived.*
import cats.effect.IO
import cats.syntax.all.*
import fs2.kafka.{AutoOffsetReset, ConsumerSettings, IsolationLevel, ProducerSettings}
import org.apache.kafka.clients.CommonClientConfigs
import org.apache.kafka.clients.consumer.ConsumerConfig
import org.apache.kafka.common.config.{SaslConfigs, SslConfigs}
import pureconfig.ConfigReader
import pureconfig.generic.derivation.default.derivedProduct as deriveReader

import scala.concurrent.duration.FiniteDuration
import org.http4s.Uri
import pureconfig.error.CannotConvert

final case class AppConfig(
  service: String,
  senderEmail: String,
  senderName: String,
  marketingCloud: MarketingCloudClientConfig,
  dataExtensionID: String,
  inTopic: String,
  dlqTopic: String,
  kafka: KafkaConfig
) derives CanEqual, Show

object AppConfig:
  given ConfigReader[AppConfig] = deriveReader[AppConfig]

final case class MarketingCloudClientConfig(
  clientID: String,
  clientSecret: String,
  httpMaxRetryWait: FiniteDuration,
  httpMaxRetries: Int,
  authEndpoint: Uri,
  endpoint: Uri,
  accountID: String
) derives CanEqual

object MarketingCloudClientConfig:
  given ConfigReader[MarketingCloudClientConfig] = deriveReader[MarketingCloudClientConfig]
  given Show[MarketingCloudClientConfig]         = semiauto.show.contramap(c => c.copy(clientSecret = "***"))
  given ConfigReader[Uri]                        = ConfigReader[String].emap(s => Uri.fromString(s).leftMap(f => CannotConvert(s, classOf[Uri].getName, f.message)))

final case class KafkaConfig(
  bootstrapServers: String,
  group: String,
  autoOffsetReset: AutoOffsetReset,
  heartbeatInterval: FiniteDuration,
  maxPollRecords: Int,
  batchCommitSize: Int,
  batchCommitInterval: FiniteDuration,
  batchSizeBytes: Int,
  linger: FiniteDuration,
  sasl: SASLConfig
) derives CanEqual, Show:

  val consumerSettings = ConsumerSettings[IO, String, String]
    .withAutoOffsetReset(autoOffsetReset)
    .withBootstrapServers(bootstrapServers)
    .withHeartbeatInterval(heartbeatInterval)
    .withMaxPollRecords(maxPollRecords)
    .withGroupId(group)
    .withIsolationLevel(IsolationLevel.ReadCommitted)
    .withProperties(sasl.properties)

  val producerSettings = ProducerSettings[IO, String, String]
    .withBootstrapServers(bootstrapServers)
    .withBatchSize(batchSizeBytes)
    .withLinger(linger)
    .withProperties(sasl.properties)

object KafkaConfig:
  given ConfigReader[KafkaConfig]     = deriveReader[KafkaConfig]
  given ConfigReader[SASLConfig]      = deriveReader[SASLConfig]
  given ConfigReader[AutoOffsetReset] = ConfigReader[String].map {
    case "earliest" => AutoOffsetReset.Earliest
    case "latest"   => AutoOffsetReset.Latest
    case "none"     => AutoOffsetReset.None
  }

case class SASLConfig(
  saslMechanism: Option[String],
  saslJaasConfig: Option[String],
  securityProtocol: Option[String],
  trustStoreLocation: Option[String],
  trustStorePassword: Option[String],
  trustStoreType: Option[String]
) derives CanEqual:
  val properties = Tuple
    .fromProductTyped(this)
    .mapN { (mch, jaas, proto, loc, pw, tpe) =>
      Map(
        SaslConfigs.SASL_MECHANISM                   -> mch,
        SaslConfigs.SASL_JAAS_CONFIG                 -> jaas,
        CommonClientConfigs.SECURITY_PROTOCOL_CONFIG -> proto,
        SslConfigs.SSL_TRUSTSTORE_LOCATION_CONFIG    -> loc,
        SslConfigs.SSL_TRUSTSTORE_PASSWORD_CONFIG    -> pw,
        SslConfigs.SSL_TRUSTSTORE_TYPE_CONFIG        -> tpe
      )
    }
    .getOrElse(Map.empty)

object SASLConfig:
  given Show[SASLConfig] = semiauto.show.contramap(c => c.copy(trustStorePassword = c.trustStorePassword.map(_ => "***")))
