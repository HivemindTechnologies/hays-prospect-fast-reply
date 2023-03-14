package com.hivemindtechnologies.hays.pfr

import cats.{Eq, Show, TraverseFilter}
import cats.effect.IO
import cats.effect.kernel.Clock
import cats.effect.std.Random
import cats.syntax.all.*
import fs2.Stream
import org.typelevel.log4cats.Logger

import scala.concurrent.duration.*
import scala.deriving.Mirror
import scala.math.{max, min, pow}

type Log = Logger[IO]

inline def log(using Log): Logger[IO] = Logger[IO]

type Eqv[A] = CanEqual[A, A]

given [A: Eqv]: Eq[A] = Eq.fromUniversalEquals

given Random[IO] = Random.javaUtilConcurrentThreadLocalRandom[IO]

given [A <: Enum[A]]: Eqv[A] = CanEqual.derived

given [A <: String & Singleton]: Show[A] = Show.show(identity)

extension [A](inline io: IO[A]) inline def stream: Stream[IO, A] = Stream.eval(io)

extension [A](stream: Stream[IO, A])
  def logErrorAndRestart(using Log): Stream[IO, A] =
    stream.attempts(defaultDelays).flatMap(_.fold(cause => log.error(cause)(cause.getMessage).stream.drain, Stream.emit))

val defaultDelays = backoffDelays(exponentialBackoff(100.millis, 2d, 0.5d, 10.seconds), 30.seconds)

def backoffDelays(backoff: Int => IO[FiniteDuration], resetAfter: FiniteDuration): Stream[IO, FiniteDuration] =
  Stream
    .repeatEval(Clock[IO].realTime)
    .scan((0, Long.MaxValue.nanos)) { case ((attempt, before), now) => (if now - before >= resetAfter then 0 else attempt + 1, now) }
    .evalMap((n, _) => backoff(n))

def exponentialBackoff(initial: FiniteDuration, base: Double, jitter: Double, maximum: FiniteDuration): Int => IO[FiniteDuration] =
  val jitAmount = max(min(jitter, 1d), 0d)
  val minMillis = initial.toMillis.toDouble
  val maxMillis = maximum.toMillis.toDouble

  attempt =>
    val upper = min(minMillis * pow(base, attempt), maxMillis)
    val diff  = (upper - minMillis) * jitAmount
    Random[IO].betweenDouble(upper - diff, upper + 1d).map(_.toLong.millis)
