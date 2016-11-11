Docker Flink TaskManager
============================
This repository holds yet another flink build definition for docker to run Apache [Flink] in containers. There exists a build definition for the Flink jobmanager and one for the Flink taskmanager. The motivation to create this build definition was to get Flink running in Docker with multiple docker containers distributed on different machines (e.g. AWS ElasticBeanstalk, AWS ECS, ..).

JobManager and TaskManager are automatically builded and available on Docker registry:
- [lzaugg/flink-jobmanager]
- [lzaugg/flink-taskmanager]

**Important**: It's based on the same image as the JobManager. For more information about the purpose of this build definition and more information (volumes, ports, environments,...) just have a look at the JobManagers README [lzaugg/flink-jobmanager].

Environment
----------------

- **`FLINK_JOBMANAGER_HOST_NAME`**
    
    **SHOULD BE SET for TaskManager**. Hostname (or IP address) to be used as connection endpoint of the JobManager. It's the same as setting `FLINK_CONF` to `jobmanager.rpc.address: <job-manager-ip>`, just more comfortable.

- **`FLINK_ADVERTISED_HOST_NAME`**

    **SHOULD BE SET for TaskManager**. Advertised hostname of taskmanager for RPC connections (back from jobmanager).

Example
---------

```
docker run -it --rm -e FLINK_ADVERTISED_HOST_NAME=myhost \
  -e FLINK_JOBMANAGER_HOST_NAME=myhost \
  -e FLINK_STATE_URL=s3://s3-flink-state/checkpoints \
  -e HADOOP_CORE_CONF='{"fs.s3a.access.key":"key","fs.s3a.secret.key":"asdf"}' \
  -e FLINK_CONF='{"recovery.jobmanager.port":6127,"recovery.mode": "zookeeper","recovery.zookeeper.quorum": "zookeeperhost:2181", "recovery.zookeeper.path.root":"/flink","recovery.zookeeper.storageDir":"s3://s3-flink-state/jobmanager"}' \
  -p 6125:6125 -p 6126:6126  lzaugg/flink-taskmanager:1.1.3_akka-2.4.12-latest
```

[Flink]: https://flink.apache.org/
[lzaugg/flink-jobmanager]: https://hub.docker.com/r/lzaugg/flink-jobmanager/
[lzaugg/flink-taskmanager]: https://hub.docker.com/r/lzaugg/flink-taskmanager/