#!/usr/bin/env bash
az login --service-principal -u $ID -p $SECRET --tenant $TENANT
az group create --name poc
az deployment group create --template-file azuredeploy_new.json --name azuredeploy_new
FUNCTIONAPPNAME=$(az deployment group show --name azuredeploy --query properties.outputs.functionAppName.value --output tsv)
echo $FUNCTIONAPPNAME
cd func_new
func azure functionapp publish $FUNCTIONAPPNAME --slot staging