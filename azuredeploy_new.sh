#!/usr/bin/env bash
az login --service-principal -u $id -p $secret --tenant $tenant
az group create --name poc
az deployment group create --template-file azuredeploy_new.json --name azuredeploy_new
functionAppName=$(az deployment group show --name azuredeploy --query properties.outputs.functionAppName.value --output tsv)
echo $functionAppName
cd func_new
func azure functionapp publish $functionAppName --slot staging