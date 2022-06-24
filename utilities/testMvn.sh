#!/bin/bash
set -x

mvnFname=$1
nxUrl="http://minutus:minutus@43.204.205.20:8081/repository/minutus-snapshot/com/crm/Pramod_WSP/0.0.1-SNAPSHOT"

artefactURL=$(cat ${mvnFname} |grep Uploading |grep jar |awk '{print $2}')
echo $artefactURL
artefactName=$(echo "${artefactURL}" |awk -F/ '{print $NF}')
echo curl -X GET "${nxUrl}/${artefactName}" --output /tmp/${artefactName}
curl -X GET "${nxUrl}/${artefactName}" --output /tmp/${artefactName}
#curl -o "${artefactURL}" /tmp/aaa
[[ $? -eq 0 ]] && echo "SUCCESS"

java -jar /tmp/${artefactName} --server.port=8085
