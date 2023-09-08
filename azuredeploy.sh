#!/usr/bin/env bash
az login --service-principal -u $id -p $secret --tenant $tenant
az group create --name poc --location australiasoutheast
az deployment group create --template-file azuredeploy.json --name azuredeploy
functionAppName=$(az deployment group show --name azuredeploy --query properties.outputs.functionAppName.value --output tsv)
echo $functionAppName
cd func
func azure functionapp publish $functionAppName