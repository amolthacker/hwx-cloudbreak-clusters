#!/bin/bash

CLUSTER_NAME=$(curl -su admin:admin -X GET http://localhost:8080/api/v1/clusters | grep cluster_name | grep -Po ': "(.+)'| grep -Po '[a-zA-Z0-9\-_!?.]+')

# Stop Atlas
curl -u admin:admin -i -H "X-Requested-By: ambari" -d '{ "RequestInfo":{ "context":"Stop Atlas via REST", "operation_level":{ "level":"SERVICE", "cluster_name":"'"${CLUSTER_NAME}"'", "service_name":"ATLAS" } }, "Body":{ "ServiceInfo":{ "state":"INSTALLED" } } }' -X PUT "http://localhost:8080/api/v1/clusters/${CLUSTER_NAME}/services/ATLAS"

sleep 20

# Start Atlas
curl -u admin:admin -i -H "X-Requested-By: ambari" -d '{ "RequestInfo":{ "context":"Start Atlas via REST", "operation_level":{ "level":"SERVICE", "cluster_name":"'"${CLUSTER_NAME}"'", "service_name":"ATLAS" } }, "Body":{ "ServiceInfo":{ "state":"STARTED" } } }' -X PUT "http://localhost:8080/api/v1/clusters/${CLUSTER_NAME}/services/ATLAS"

sleep 120
