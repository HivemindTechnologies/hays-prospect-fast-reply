package com.hivemindtechnologies.hays.pfr

import cats.Show
import cats.effect.IO
import cats.syntax.all.*
import fs2.{Pipe, Stream}
import fs2.kafka.*
import org.apache.kafka.clients.consumer.OffsetAndMetadata
import org.typelevel.log4cats.Logger

import scala.concurrent.duration.*

class Kafka(config: KafkaConfig):
  import Kafka.{*, given}

  def streamFrom(topic: String): Stream[IO, Committable] = 
    KafkaConsumer.stream(config.consumerSettings).subscribeTo(topic).records

  def batchCommitOffsets: Pipe[IO, Offset, Unit] =
    if config.batchCommitSize == 1
    then _.evalMap(_.commit)
    else commitBatchWithin[IO](config.batchCommitSize, config.batchCommitInterval)

object Kafka:
  type Committable = CommittableConsumerRecord[IO, String, String]
  type Offset      = CommittableOffset[IO]

  given Show[OffsetAndMetadata] = Show.fromToString
