FROM centos:centos7.9.2009

WORKDIR /data

COPY start-kafka.sh /data
COPY zoo.cfg /data
COPY server.properties /data

ARG ZK_VERSION=3.7.0
ARG KAFKA_SCALA_VERSION=2.12
ARG KAFKA_VERSION=2.8.1

EXPOSE 2181 9092

RUN yum update -y
RUN yum install wget java-1.8.0-openjdk-devel java-1.8.0-openjdk -y

RUN wget https://mirrors.tuna.tsinghua.edu.cn/apache/kafka/${KAFKA_VERSION}/kafka_${KAFKA_SCALA_VERSION}-${KAFKA_VERSION}.tgz
RUN wget https://mirrors.tuna.tsinghua.edu.cn/apache/zookeeper/zookeeper-${ZK_VERSION}/apache-zookeeper-${ZK_VERSION}-bin.tar.gz

RUN tar zxvf kafka_${KAFKA_SCALA_VERSION}-${KAFKA_VERSION}.tgz
RUN tar zxvf apache-zookeeper-${ZK_VERSION}-bin.tar.gz

RUN ln -s kafka_${KAFKA_SCALA_VERSION}-${KAFKA_VERSION} kafka
RUN ln -s apache-zookeeper-${ZK_VERSION}-bin zookeeper

RUN cp /data/zoo.cfg /data/zookeeper/conf
RUN cp /data/server.properties /data/kafka/config

RUN mkdir /data/zookeeper/data
RUN mkdir /data/kafka/kafka-logs

CMD ["bash", "/data/start-kafka.sh"]