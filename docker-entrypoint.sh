#!/bin/bash

#
# Most of this is taken from /usr/sbin/zabbix_java_gateway that is
# provided with the package. 

GATEWAY_HOME="/usr/share/zabbix-java-gateway"
cd $GATEWAY_HOME

JAVA=${JAVA:-java}

for jar in lib/*.jar bin/*.jar; do
	CLASSPATH="$CLASSPATH:$jar"
done

#
# START_POLLERS is set to 5 in the Dockerfile
if [ -n "$START_POLLERS" ]; then
	ZABBIX_OPTIONS="$ZABBIX_OPTIONS -Dzabbix.startPollers=$START_POLLERS"
fi

#
# Determine the command line and exec it as user zabbix (created by the 
# installation of the zabbix-java-server package
COMMAND_LINE="$JAVA $JAVA_OPTIONS -classpath $CLASSPATH $ZABBIX_OPTIONS com.zabbix.gateway.JavaGateway"
exec su -s /bin/bash -c "$COMMAND_LINE" zabbix
