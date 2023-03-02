package com.hivemindtechnologies.hays.pfr

import cats.effect.IO
import cats.syntax.all.*
import fs2.{Chunk, Pipe, Stream}
import io.circe.Error
import io.circe.parser.decode
import io.circe.syntax.*

import scala.concurrent.duration.*
import scala.util.chaining.*

import Kafka.{*, given}

class Service(config: AppConfig)(using Log):
  val kafka = Kafka(config.kafka)

  def dataflow: Stream[IO, Unit] =
    kafka
      .streamFrom(config.inTopic)
      .evalTap(in => log.info(show"Processing ${in.offset.offsetAndMetadata}"))
      .map(in => (decode[BusinessPartner](in.record.value), in))
      .evalTap[IO, Unit] {
        case (Left(err), in) =>
          log.error(err)(show"Decoding failed for ${in.offset.offsetAndMetadata}")
        case (Right(bp), in) =>
          sendRecordToMarketingCloud(bp)
      }
      .map(_._2.offset)
      .through(kafka.batchCommitOffsets)

  def sendRecordToMarketingCloud(bp: BusinessPartner): IO[Unit] = 
    log.info(show"Sending $bp")
