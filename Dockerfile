FROM centos
MAINTAINER Sander van Dinten

RUN yum -y install http://repo.zabbix.com/zabbix/2.4/rhel/7/x86_64/zabbix-release-2.4-1.el7.noarch.rpm
RUN yum -y install zabbix-java-gateway

ENV START_POLLERS 5
COPY docker-entrypoint.sh /

EXPOSE 10052

CMD /docker-entrypoint.sh
