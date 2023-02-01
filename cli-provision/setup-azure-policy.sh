#! /bin/bash

export RG_NAME="supersecure"
export CLUSTER_NAME="akscluster"
export AZURE_CLIENTID=""
export AZURE_SECRET=""
export AZURE_TENANT=""


echo "Logging you into your service principal ..."
az login --service-principal -u $AZURE_CLIENTID -p $AZURE_SECRET --tenant $AZURE_TENANT

az aks get-credentials --resource-group $RG_NAME --name $CLUSTER_NAME

echo "Disabling Pod Security Polices -- they do not peacefully coexist with Open Policy Agent and Gatekeeper ... "
az aks update --name $CLUSTER_NAME --resource-group $RG_NAME --disable-pod-security-policy

echo "Starting Azure Policy installation .."
az aks enable-addons --addons azure-policy --resource-group $RG_NAME --name $CLUSTER_NAME

az aks show --query addonProfiles.azurepolicy --resource-group $RG_NAME --name $CLUSTER_NAME 


echo "Aure Policy has been enabled in the Kubernetes Cluster"
echo "In the Azure Portal, Policy can be assigned for your Kubernetes cluster"

az policy state trigger-scan