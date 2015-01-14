#!/bin/bash

mvn clean install

WAR=$(ls target/stelligent*.war)

ant -file manage.xml -Ddeploy.war=${WAR}
