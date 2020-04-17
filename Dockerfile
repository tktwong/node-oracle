FROM node:13.12.0

RUN apt-get update && \
  apt-get install sudo

RUN sudo apt-get install unzip curl

RUN mkdir -p /opt/oracle
WORKDIR /opt/oracle

RUN sudo curl -s -k https://download.oracle.com/otn_software/linux/instantclient/19600/instantclient-basic-linux.x64-19.6.0.0.0dbru.zip --output instantclient.zip
RUN sudo unzip instantclient.zip

RUN sudo sh -c "echo /opt/oracle/instantclient_19_6 > /etc/ld.so.conf.d/oracle-instantclient.conf"
RUN sudo cat /etc/ld.so.conf.d/oracle-instantclient.conf