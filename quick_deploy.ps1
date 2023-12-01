$resourceGroup = "digital-twin"
$location = "westus2"
$tenant_id = "00000000-0000-0000-0000-000000000000"


# Load a file named config.yaml and set the variables in the file as environment variables
Get-Content config.yaml | ForEach-Object { $key, $value = $_.split(':'); Set-Item -Path "env:$key" -Value $value.Trim() }


# Log into azure cli with a specific tenant
az login --tenant $tenant_id

# Create a resource group
az group create --name $resourceGroup --location "westus2"

# Deploy web app
az deployment group create --resource-group $resourceGroup --template-file webapp.json --parameters webapp.parameters.json
