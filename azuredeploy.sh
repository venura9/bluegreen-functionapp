#!/usr/bin/env bash
az login --service-principal -u $ID -p $SECRET --tenant $TENANT
az group create --name poc --location australiasoutheast
az deployment group create --template-file azuredeploy.json --name azuredeploy
FUNCTIONAPPNAME=$(az deployment group show --name azuredeploy --query properties.outputs.functionAppName.value --output tsv)
echo $FUNCTIONAPPNAME
cd func
func azure functionapp publish $FUNCTIONAPPNAME