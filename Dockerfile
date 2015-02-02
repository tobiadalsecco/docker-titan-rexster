FROM ubuntu:14.10

MAINTAINER Matt Koski <maccam912@gmail.com>

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install libdb-dev -y
RUN apt-get install libdb-java-dev -y
RUN echo "deb-src http://www.apache.org/dist/cassandra/debian 21x main" >> "deb http://www.apache.org/dist/cassandra/debian 21x main" >> /etc/apt/sources.list.d/cassandra.sources.list

RUN gpg --keyserver keyserver.ubuntu.com --recv-keys 4BD736A82B5C1B00
RUN gpg --export --armor 4BD736A82B5C1B00 | sudo apt-key add -
RUN gpg --keyserver keyserver.ubuntu.com --recv-keys F758CE318D77295D
RUN gpg --export --armor F758CE318D77295D | sudo apt-key add -
 
#sudo apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 4BD736A82B5C1B00
 
# update repository
sudo apt-get update
 
# install
sudo apt-get install -y cassandra


#RUN apt-get install elasticsearch -y
RUN apt-get install default-jre -y
RUN apt-get install wget -y
RUN apt-get install unzip -y

RUN wget http://s3.thinkaurelius.com/downloads/titan/titan-0.5.3-hadoop2.zip

RUN unzip titan-0.5.3-hadoop2.zip && rm titan-0.5.3-hadoop2.zip

RUN cassandra -f &
RUN elasticsearch &

RUN cd titan-0.5.3-hadoop2 && ./bin/titan.sh start -c berkeleydb &
#RUN cd titan-0.5.3-hadoop2 && ./bin/titan.sh start -c cassandra-es &

RUN cd titan-0.5.3-hadoop2 && ./bin/rexster-console.sh &

EXPOSE 8182:8182
EXPOSE 8183:8183
EXPOSE 8184:8184
