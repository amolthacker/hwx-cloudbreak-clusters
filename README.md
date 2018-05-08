# hwx-cloudbreak-clusters

Automated provisioning of HWX (HDP/HDF) clusters in public/private cloud using Hortonworks Cloudbreak

## Prerequisites

 * Access to [Hortonworks Cloudbreak](https://docs.hortonworks.com/HDPDocuments/Cloudbreak/Cloudbreak-2.4.1/content/index.html) instance setup with credentials for respective cloud providers
 * [Cloudbreak CLI](https://docs.hortonworks.com/HDPDocuments/Cloudbreak/Cloudbreak-2.4.1/content/cli-install/index.html) installed, in path and configured to point to the Cloudbreak instance

 You can also use this [tool to setup a local instance of Cloudbreak with a configured CLI](https://github.com/amolthacker/hwx-local-cloudbreak)

## Steps

 1. Clone the repo
 
 2. Update cloud configurations
    - under `clusters/aws/hwx/hwx-aws-dm.json` for AWS
    - under `clusters/openstack/hwx-field-cloud/hwx-os-dm.json` for OpenStack
   especially:
   ```
    general.credentialName                  // credential to use as configured in Cloudbreak
    tags                                    // tags for billing, ops and audit
    placement                               // region and availability zone
    network                                 // configured virtual private network
    instanceGroups.template.instanceType    // instance types
    instanceGroups.template.securityGroup   // configured network security group associated with the network
    stackAuthentication                     // configured SSH key details
   ```

3. Setup Cloudbreak and Create Cluster
   
   If running for the first time, run
   ```
   $  ./scripts/import-artifacts-n-create-cluster.sh <CLOUD> [where CLOUD => 'openstack' or 'aws']
   ```
   This will first import the blueprint (under `cloudbreak/blueprints`) and recipes (under `cloudbreak/recipes`) into Cloudbreak and then create the cluster

   If the blueprints and recipes have already been imported, run
   ```
   $  ./scripts/create-cluster.sh <CLOUD>
   ```
