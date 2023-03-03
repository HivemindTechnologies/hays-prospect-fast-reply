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

  def producer[A]: Pipe[IO, ProducerRecords[A, String, String], ProducerResult[A, String, String]] =
    KafkaProducer.pipe[IO, String, String, A](config.producerSettings)

  def passthroughProducer[A]: Pipe[IO, ProducerRecords[A, String, String], A] = producer[A].andThen(_.map(_.passthrough))

object Kafka:
  type Committable = CommittableConsumerRecord[IO, String, String]
  type Offset      = CommittableOffset[IO]
  type Record      = ProducerRecord[String, String]
  type Records     = ProducerRecords[Offset, String, String]
  type Sent        = ProducerResult[Offset, String, String]

  given Show[OffsetAndMetadata] = Show.fromToString
