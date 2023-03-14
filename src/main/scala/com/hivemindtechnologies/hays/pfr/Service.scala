package com.hivemindtechnologies.hays.pfr

import cats.effect.IO
import cats.syntax.all.*
import fs2.{Chunk, Pipe, Stream}
import fs2.kafka.{ProducerRecord, ProducerRecords}
import io.circe.Error
import io.circe.parser.decode
import io.circe.syntax.*

import scala.concurrent.duration.*
import scala.util.chaining.*

import Kafka.{*, given}
import JSON.given

class Service(config: AppConfig, client: MarketingCloudClient)(using Log):
  val kafka = Kafka(config.kafka)

  def dataflow: Stream[IO, Unit] =
    kafka
      .streamFrom(config.inTopic)
      .evalTap(in => log.info(show"Processing ${in.offset.offsetAndMetadata}"))
      .map(in => (decode[Request](in.record.value), in))
      .flatMap {
        case (Left(err), in) =>
          Stream
            .emit(ProducerRecord(config.dlqTopic, in.record.key, DLQMessage(err.getMessage, in.record.value).asJson.spaces2))
            .map(ProducerRecords.one(_, in.offset))
            .evalTap(_ => log.error(err)(show"Decoding failed for ${in.offset.offsetAndMetadata}"))
            .through(kafka.passthroughProducer)
        case (Right(bp), in) =>
          client.send(bp).as(in.offset).stream
      }
      .through(kafka.batchCommitOffsets)
