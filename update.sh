#!/bin/bash

TOMCATDIR=/usr/share/tomcat6
USERNAME=admin
PASSWORD=password

yum -y install tomcat6-admin-webapps

sed -s "s/<\/tomcat-users>/<user username=\"${USERNAME}\" password=\"${PASSWORD}\" roles=\"manager,admin,manager-script\"\/>\n<\/tomcat-users>/" ${TOMCATDIR}/conf/tomcat-users.xml

mvn clean install

WAR=$(ls target/stelligent*.war)

ant -file manage.xml -Ddeploy.war=${WAR} -Ddeploy.user=${USERNAME} -Ddeploy.pass=${PASSWORD} -Dtomcat.dir=${TOMCATDIR}
