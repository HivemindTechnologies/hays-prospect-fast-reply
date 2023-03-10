package com.hivemindtechnologies.hays.pfr

import cats.effect.IO
import com.exacttarget.fuelsdk.ETConfiguration
import shapeless3.deriving.*

sealed trait Setting[A]:
  def apply(a: A): Setting.Setter

object Setting:
  type Setter = String => IO[ETConfiguration] => IO[ETConfiguration]

  given [A](using s: Setting[A]): Setting[Option[A]] with
    def apply(oa: Option[A]): Setter = name => config => oa.fold(config)(s.apply(_)(name)(config))

  given [A <: String | Boolean]: Setting[A] with
    def apply(a: A): Setter = name => config => config.flatTap(c => IO(c.set(name, a.toString)))
    
  def allOf(config: MarketingCloudClientConfig): List[IO[ETConfiguration] => IO[ETConfiguration]] =
    val setters = K0
      .ProductInstances[Setting, MarketingCloudClientConfig]
      .foldRight(config)(List.empty[Setter])([A] => (setting: Setting[A], a: A, accu: List[Setter]) => setting(a) :: accu)

    config.productElementNames.toList.zip(setters).map((name, setter) => setter(name))