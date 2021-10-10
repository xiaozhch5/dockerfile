/data/zookeeper/bin/zkServer.sh start

/data/kafka/bin/kafka-server-start.sh -daemon /data/kafka/config/server.properties

tail -F /data/kafka/logs/server.log