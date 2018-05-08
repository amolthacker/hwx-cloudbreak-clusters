#!/bin/bash

BASE_DIR="$(dirname $0)"
source $BASE_DIR/utils.sh cb-blueprints

BLUEPRINT_NAME='Data Management: Apache Atlas, Apache Ranger'
BLUEPRINT_DESC='Useful for Data Governance and Security using Apache Atlas and Apache Ranger'

logInfo "Importing Ambari Blueprint ..."
cb blueprint create from-file --file blueprints/hdp26-data-mgmnt.json --name "${BLUEPRINT_NAME}" --description "${BLUEPRINT_DESC}"
exitOnErr "Blueprint import failed"
