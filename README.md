Docker Flink TaskManager
============================
This repository holds yet another flink build definition for docker to run Apache [Flink] in containers. There exists a build definition for the Flink jobmanager and one for the Flink taskmanager. The motivation to create this build definition was to get Flink running in Docker with multiple docker containers distributed on different machines (e.g. AWS ElasticBeanstalk, AWS ECS, ..).

JobManager and TaskManager are automatically builded and available on Docker registry:
- [lzaugg/flink-jobmanager]
- [lzaugg/flink-taskmanager]

The built docker image has (more or less):
- proper signal handling
- docker friendly logging configurations (rolling file appenders, console)
- a minimal footprint (thanks to alpine linux)
- a simple runner without using supervisor, zookeeper, docker compose... just calling java directly (while all those other things are still possible)
- a convenient way to configure flink through environment variables (`FLINK_CONF`,..)
- patched version of Flink 1.0.1 with akka 2.4.4 to support NATed netty with bind hostname and exposed hostname (check tag of docker image!)

**Important**: It's based on the same image as the JobManager. For more information about the purpose of this build definition and more information just have a look at the JobManagers README [lzaugg/flink-jobmanager].

Quick Start
-------------
```
$ # start jobmanager
$ docker run -e FLINK_ADVERTISED_HOST_NAME=192.168.99.100 -p 6123:6123 -p 6124:6124 -p 8081:8081 lzaugg/flink-jobmanager:1.0.1_akka-2.4.4-latest
$ 
$ # start taskmanager
$ docker run -e FLINK_JOBMANAGER_HOST_NAME=192.168.99.100 lzaugg/flink-taskmanager:1.0.1_akka-2.4.4-latest
```


Environment
----------------
Several environment variables are supported. The most important are:
- `JVM_ARGS`: you know, the things like ```-Xmx768m```
- `FLINK_ENV_JAVA_OPTS`: additional java options for flink, e.g. properties (via -D)
- `FLINK_CONF`: accepts any YAML string. Can be used to configure (override) everything which resides in flink-conf.yaml. E.g. ```{jobmanager.rpc.port: 6123}```
- `FLINK_JOBMANAGER_HOST_NAME`: convenient way to set ```jobmanager.rpc.address```. SHOULD be configured.

[Flink]: https://flink.apache.org/
[lzaugg/flink-jobmanager]: https://hub.docker.com/r/lzaugg/flink-jobmanager/
[lzaugg/flink-taskmanager]: https://hub.docker.com/r/lzaugg/flink-taskmanager/