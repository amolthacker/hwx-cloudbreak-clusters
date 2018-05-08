#!/bin/bash

BASE_DIR="$(dirname $0)"
source $BASE_DIR/utils.sh cb-recipes

logInfo "Importing Recipes ..."
cb recipe create from-file --file recipes/ranger-db-setup.sh --name ranger-db-setup --description "Ranger DB Setup" --execution-type pre-ambari-start
cb recipe create from-file --file recipes/ranger-db-setup-aws.sh --name ranger-db-setup-aws --description "Ranger DB Setup for AWS" --execution-type pre-ambari-start
cb recipe create from-file --file recipes/restart-atlas.sh --name restart-atlas --description "Restart Atlas" --execution-type post-cluster-install
exitOnErr "Recipe import failed"
