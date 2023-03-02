import com.typesafe.sbt.packager.docker.{Cmd, DockerChmodType}

inThisBuild(
  Seq(
    scalaVersion            := "3.2.2",
    sourcesInBase           := false,
    tpolecatDevModeOptions ++= Set(
      ScalacOptions.other("-new-syntax"),             // Require `then` and `do` in control expressions.
      ScalacOptions.sourceFuture,                     // Mostly so the compiler no longer desugars tuples in `for` comprehensions to `withFilter` calls.
      ScalacOptions.other("-language:strictEquality") // Allow equality checks between types `A` and `B` only when an instance of `CanEqual[A, B]` is in scope
    )
  )
)

addCommandAlias("compileAll", "all compile Test/compile IntegrationTest/compile")

lazy val sfmcConnect = project
  .in(file("."))
  .enablePlugins(JavaAppPackaging, DockerPlugin, AshScriptPlugin)
  .configs(IntegrationTest)
  .settings(dockerSettings)
  .settings(dontBuildDocs)
  .settings(testWithWeaver(Test, IntegrationTest))
  .settings(integrationTestSettings)
  .settings(
    libraryDependencies := Seq(
      catsCore,
      catsEffect,
      circeCore,
      circeGeneric,
      circeParser,
      fs2,
      fs2IO,
      fs2Kafka,
      kittens,
      log4Cats,
      logback,
      pureconfig,
      pureconfigCE
    )
  )

lazy val dockerSettings = Seq(
  dockerBaseImage    := "azul/zulu-openjdk-alpine:17-jre-headless-latest",
  dockerUpdateLatest := true,
  dockerCommands     := dockerCommands.value.flatMap {
    case cmd @ Cmd("FROM", _, "as", "mainstage") =>
      List(cmd, Cmd("RUN", "apk --update-cache upgrade && rm -rf /var/cache/apk/*"))
    case other                                   =>
      List(other)
  }
)

lazy val dontBuildDocs = Seq(
  Compile / doc / sources                := Nil,
  Compile / packageDoc / publishArtifact := false
)

def testWithWeaver(config: Configuration, configs: Configuration*) = {
  val cfg = (config +: configs).map(_.name).mkString(",")
  Seq(
    testFrameworks       := Seq(new TestFramework("weaver.framework.CatsEffect")),
    libraryDependencies ++= Seq(scalaCheck % cfg, scalaCheckCats % cfg, weaver % cfg, weaverScalaCheck % cfg)
  )
}

lazy val integrationTestSettings = Defaults.itSettings ++ Seq(
  IntegrationTest / fork              := true,
  IntegrationTest / parallelExecution := false
)

lazy val catsCore         = "org.typelevel"         %% "cats-core"              % "2.9.0"
lazy val catsEffect       = "org.typelevel"         %% "cats-effect"            % "3.4.8"
lazy val circeCore        = "io.circe"              %% "circe-core"             % "0.14.4"
lazy val circeGeneric     = circeCore.organization  %% "circe-generic"          % circeCore.revision
lazy val circeParser      = circeCore.organization  %% "circe-parser"           % circeCore.revision
lazy val fs2              = "co.fs2"                %% "fs2-core"               % "3.6.1"
lazy val fs2IO            = fs2.organization        %% "fs2-io"                 % fs2.revision
lazy val fs2Kafka         = "com.github.fd4s"       %% "fs2-kafka"              % "2.5.0"
lazy val kittens          = "org.typelevel"         %% "kittens"                % "3.0.0"
lazy val log4Cats         = "org.typelevel"         %% "log4cats-slf4j"         % "2.5.0"
lazy val logback          = "ch.qos.logback"         % "logback-classic"        % "1.4.5"
lazy val pureconfig       = "com.github.pureconfig" %% "pureconfig-core"        % "0.17.2"
lazy val pureconfigCE     = pureconfig.organization %% "pureconfig-cats-effect" % pureconfig.revision
lazy val scalaCheck       = "org.scalacheck"        %% "scalacheck"             % "1.17.0"
lazy val scalaCheckCats   = "io.chrisdavenport"     %% "cats-scalacheck"        % "0.3.2"
lazy val weaver           = "com.disneystreaming"   %% "weaver-cats"            % "0.8.1"
lazy val weaverScalaCheck = weaver.organization     %% "weaver-scalacheck"      % weaver.revision
