#!/bin/bash

. settings.conf

yum -y install tomcat6-admin-webapps

sed -s "s/<\/tomcat-users>/<user username=\"${USERNAME}\" password=\"${PASSWORD}\" roles=\"manager,admin,manager-script\"\/>\n<\/tomcat-users>/" ${TOMCATDIR}/conf/tomcat-users.xml

service tomcat6 start

bash update.sh
