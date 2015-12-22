FROM centos:7
MAINTAINER Sander van Dinten <sander@vandinten.nl>

RUN yum -y update && \
    yum -y install http://repo.zabbix.com/zabbix/2.4/rhel/7/x86_64/zabbix-release-2.4-1.el7.noarch.rpm && \
    yum -y install zabbix-java-gateway-2.4.7 && \
    yum clean all

ENV START_POLLERS 5

COPY docker-entrypoint.sh /

EXPOSE 10052

ENTRYPOINT /docker-entrypoint.sh
