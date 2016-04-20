FROM lzaugg/flink-jobmanager:1.0.1_akka-2.4.4
MAINTAINER l.zaugg@mypi.ch

ADD conf/flink-conf.yaml $FLINK_HOME/conf

ENV FLINK_CLASS_TO_RUN org.apache.flink.runtime.taskmanager.TaskManager
CMD [ ]
