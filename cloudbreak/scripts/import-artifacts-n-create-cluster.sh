#!/bin/bash

BASE_DIR="$(dirname $0)"

function usage {
    echo " Usage: $0 <CLOUD> where CLOUD is either 'openstack' or 'aws'"
    echo " [eg: $0 openstack]"
    exit 1
}

[[ -z $1 ]] && usage
CLOUD=$1

./$BASE_DIR/import-blueprints.sh
./$BASE_DIR/import-recipes.sh
./$BASE_DIR/create-cluster.sh $CLOUD
