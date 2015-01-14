#!/bin/bash

. settings.conf

mvn clean install

WAR=$(ls target/stelligent*.war)

ant -file manage.xml -Ddeploy.war=${WAR} -Ddeploy.user=${USERNAME} -Ddeploy.pass=${PASSWORD} -Dtomcat.dir=${TOMCATDIR}
