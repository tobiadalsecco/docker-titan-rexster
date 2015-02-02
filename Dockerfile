FROM ubuntu:14.10

MAINTAINER Matt Koski <maccam912@gmail.com>

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install titan -y
RUN apt-get install cassandra -y
RUN apt-get install elasticsearch -y
RUN apt-get install default-jre -y
RUN apt-get install wget -y
RUN apt-get install unzip -y

RUN wget http://s3.thinkaurelius.com/downloads/titan/titan-0.5.3-hadoop2.zip

RUN unzip titan-0.5.3-hadoop2.zip && rm titan-0.5.3-hadoop2.zip

RUN cassandra -f &
RUN elasticsearch &

RUN cd titan-0.5.3-hadoop2 && ./bin/titan.sh start -c cassandra-es &

RUN cd titan-0.5.3-hadoop2 && ./bin/rexster-console.sh &
