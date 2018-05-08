#!/bin/bash

BASE_DIR="$(dirname $0)"
source $BASE_DIR/utils.sh cb-clusters

function usage {
    echo " Usage: $0 <CLOUD> where CLOUD is either 'openstack' or 'aws'"
    echo " [eg: $0 openstack]"
    exit 1
}

[[ -z $1 ]] && usage

CLOUD=$1
case "$CLOUD" in
'openstack')
config_dir='hwx-field-cloud'
cluster_name='hwx-os-dm'
;;
'aws')
config_dir='hwx'
cluster_name='hwx-aws-dm'
;;
esac

config_file="clusters/$CLOUD/$config_dir/$cluster_name.json"
logInfo "Creating cluster '$cluster_name' using blueprint '$config_file' ..."
cb cluster create --cli-input-json $config_file --name $cluster_name
exitOnErr "Cluster creation failed"
