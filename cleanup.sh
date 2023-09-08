az login --service-principal -u $id -p $secret --tenant $tenant
az group delete --name poc