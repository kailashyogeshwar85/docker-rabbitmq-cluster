FROM lucifer8591/rabbitmq_base:3.7.17

LABEL MAINTAINER="Kailash K Yogeshwar <kailashyogeshwar85@gmail.com>"
LABEL build_date="03-09-2019"
LABEL image="lucifer8591/rabbitmq-server:3.7.17"

ENV RABBIT_BASEDIR="/rabbitmq/rabbitmq_server-3.7.17"
WORKDIR /rabbitmq/
RUN apk add --no-cache procps # Refer https://github.com/docker-library/rabbitmq/issues/162

RUN addgroup -S rabbitmq && adduser -S -H rabbitmq -G rabbitmq

ADD rabbitmq.conf ${RABBIT_BASEDIR}/etc/rabbitmq/
ADD erlang.cookie ${RABBIT_BASEDIR}/var/lib/rabbitmq/.erlang.cookie

#Add startup script in /opt/rabbit
ADD startrabbit.sh /opt/rabbit/

#Provide necessary permissions to config files
# Do we need to add user
RUN chmod u+rw ${RABBIT_BASEDIR}/etc/rabbitmq/rabbitmq.conf \
&& chown rabbitmq:rabbitmq ${RABBIT_BASEDIR}/var/lib/rabbitmq/.erlang.cookie \
&& chmod 400 ${RABBIT_BASEDIR}/var/lib/rabbitmq/.erlang.cookie \
&& mkdir -p /opt/rabbit \
&& chmod a+x /opt/rabbit/startrabbit.sh

# 5672  - Used by AMQP 0-9-1 and 1.0 clients with and without TLS
# 15672 - HTTP API clients, Management UI & rabbitmqadmin
# 25672 - Used for inter-node & CLI tools communication (Erlang distribution server port), computed as AMQP default port (5672) + 20000
# 4369  - erlang port mapper daemon (epmd) a peer discovery service used by RabbitMQ nodes and CLI Tools
# 9100-04 - ?

EXPOSE 5672 \
15672 \
25672 \
4369 \
9100 \
9101 \
9102 \
9103 \
9104

CMD /opt/rabbit/startrabbit.sh