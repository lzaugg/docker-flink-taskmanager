FROM lzaugg/flink-jobmanager:1.0.1_akka-2.4.4
MAINTAINER l.zaugg@mypi.ch

ENV FLINK_CLASS_TO_RUN org.apache.flink.runtime.taskmanager.TaskManager

EXPOSE 6123 8080 8081
