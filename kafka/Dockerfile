FROM openjdk:8u292-slim-buster

WORKDIR /opt

ARG kafkaversion=3.3.1
ARG scalaversion=2.13

RUN apt update \
    && apt install -y --no-install-recommends wget

RUN wget https://downloads.apache.org/kafka/${kafkaversion}/kafka_${scalaversion}-${kafkaversion}.tgz -O kafka.tgz \
    && tar xvzf kafka.tgz \
    && mv kafka_${scalaversion}-${kafkaversion} kafka

WORKDIR /opt/kafka

COPY ./conf/server.properties ./config/kraft/.
COPY ./*.sh ./

EXPOSE $KRAFT_BROKER_PORT $KRAFT_CONTROLLER_PORT $KRAFT_EXTERNAL_PORT

ENTRYPOINT [ "./docker-entrypoint.sh" ]