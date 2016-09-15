FROM lzaugg/flink-jobmanager:1.1.2_akka-2.4.9-latest
MAINTAINER l.zaugg@mypi.ch

ADD conf/flink-conf.yaml $FLINK_HOME/conf/

ENV FLINK_CLASS_TO_RUN org.apache.flink.runtime.taskmanager.TaskManager

ENTRYPOINT [ "/opt/flink/bin/docker_flink-run.sh" ]

CMD ["--configDir", "/opt/flink/conf/" ]
