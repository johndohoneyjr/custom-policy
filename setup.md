# Essential Setup

1. SetUp Environment
az login

The login response will have a JSON document, the "id" attribute is your Subscription ID
SetUp your environment"

SUBSCRIPTION_ID="xxxxf5c1-wwww-yyyy-zzzz-3e60c0a3qqqq"
SERVICE_PRINCIPAL_NAME="Kubernetes-Policy"
RESOURCE_GROUP="customerName-Product-idNumber"

2. Create a service principal

az login --use-device-code

## Subscription Level Scope
az ad sp create-for-rbac --name $SERVICE_PRINCIPAL_NAME --role Contributor --scopes /subscriptions/$SUBSCRIPTION_ID  --sdk-auth > sp.json

## Resource Group Level Scope
az ad sp create-for-rbac --name $SERVICE_PRINCIPAL_NAME --role Contributor --scopes /subscriptions/$SUBSCRIPTION_ID/resourceGroups/$RESOURCE_GROUP  --sdk-auth > sp.json

The output file, sp.json is convenient to later parse to set up your environment that you will need for authentication

# Setting up to use Policy SDK with Python

# Make sure jq is installed -- very handy command line tool
# https://stedolan.github.io/jq/download

# Handy BASH command to verify existence of a file (jq in this case)
command -v jq >/dev/null 2>&1 || { echo >&2 "I require jq for this script, but it's not installed, download jq at: https://stedolan.github.io/jq/download/.  Aborting."; exit 1; }


export PT_CLIENT_ID=$(cat sp.json | jq -r .clientId)
export PT_CLIENT_SECRET=$(cat sp.json | jq -r .clientId)
export PT_RESOURCE_URL=$(cat sp.json | jq -r .clientId)
export PT_TENANT_ID=$(cat sp.json | jq -r .clientId)