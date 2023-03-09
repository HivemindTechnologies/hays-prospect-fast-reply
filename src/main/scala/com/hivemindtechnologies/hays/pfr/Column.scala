package com.hivemindtechnologies.hays.pfr

import shapeless3.deriving.*
import java.util.UUID
import java.time.Instant

sealed trait Column[A]:
  def serialize(a: A): String

object Column:
  given [A <: Double | Instant | String | UUID]: Column[A] with
    def serialize(a: A): String = a.toString

  def valuesOf[A](a: A)(using inst: K0.ProductInstances[Column, A]): List[String] = 
    inst.foldRight(a)(List.empty[String])([t] => (cw: Column[t], v: t, acc: List[String]) => cw.serialize(v) :: acc)