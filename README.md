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


[Flink]: https://flink.apache.org/
[lzaugg/flink-jobmanager]: https://hub.docker.com/r/lzaugg/flink-jobmanager/
[lzaugg/flink-taskmanager]: https://hub.docker.com/r/lzaugg/flink-taskmanager/