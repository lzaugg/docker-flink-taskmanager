Docker Flink TaskManager
============================
It's based on the same image as the JobManager. For more information about the purpose of this image just have a look at the JobManagers README.


Environment
==============
Several environment variables are supported. The most important are:
- JVM_ARGS: you know, the things like ```-Xmx768m```
- FLINK_ENV_JAVA_OPTS: additional java options for flink, e.g. properties (via -D)
- FLINK_CONF: accepts any YAML string. Can be used to configure (override) everything which resides in flink-conf.yaml. E.g. ```{jobmanager.rpc.port: 6123}```

Cluster Setup
============
Start as many containers as you like to have taskmanagers and set ```jobmanager.rpc.address``` to the host address/name of the jobmanager.


Examples
============
```run --rm -e "FLINK_CONF={jobmanager.rpc.address: server.example.com}" lzaugg/flink-taskmanager:1.0.1```