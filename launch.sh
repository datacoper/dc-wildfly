#!/bin/bash
sudo docker run -d -p 8080:8080 --network host -v /home/filho/wildfly/standalone/deployments:/opt/jboss/wildfly/standalone/deployments --name wild robertofilho/dc-wildfly
#sudo docker inspect wild
