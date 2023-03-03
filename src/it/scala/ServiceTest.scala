package com.hivemindtechnologies.hays.pfr

import cats.Show
import cats.data.NonEmptyVector
import cats.derived.*
import cats.effect.*
import cats.effect.kernel.Resource
import cats.syntax.all.*
import com.dimafeng.testcontainers.KafkaContainer
import com.dimafeng.testcontainers.KafkaContainer.Def
import fs2.Stream
import fs2.io.file.Files
import fs2.kafka.*
import io.circe.parser.decode
import io.circe.syntax.*
import org.testcontainers.utility.DockerImageName
import org.typelevel.log4cats.slf4j.Slf4jLogger
import weaver.{Log as WLog, *}

import java.util.UUID
import scala.concurrent.duration.*

import Kafka.*

object ServiceTest extends IOSuite:

  test("Received records should be sent to SF Marketing Cloud") { bootstrapServers =>
    for
      given Log  <- Main.logger
      config     <- Main.configFX.map(c => c.copy(kafka = c.kafka.copy(bootstrapServers = bootstrapServers)))
      _          <- log.debug(config.show)
      given Kafka = Kafka(config.kafka)
      collector  <- Ref.empty[IO, Vector[BusinessPartner]]
      client      = new MarketingCloudClient:
                      override def send(bp: BusinessPartner) = collector.getAndUpdate(_ :+ bp).void
      input       = Vector(BusinessPartner("meep"), BusinessPartner("moop"))
      _          <- input.traverse(record => send(ProducerRecord(config.inTopic, "some kinda key", record.asJson.spaces2)).timeout(5.seconds))
      _          <- Service(config, client).dataflow.compile.drain.background.use(_ => IO.sleep(5.seconds))
      output     <- collector.get
    yield expect(input == output)
  }

  type Res = String

  override def sharedResource: Resource[IO, Res] =
    Resource
      .make(IO.blocking(Def(DockerImageName.parse("confluentinc/cp-kafka:7.3.1")).start()))(c => IO.blocking(c.stop).orElse(IO.unit))
      .map(_.bootstrapServers)

  def send(record: Record)(using kafka: Kafka): IO[Unit] =
    Stream(ProducerRecords.one(record)).through(kafka.producer).compile.drain
