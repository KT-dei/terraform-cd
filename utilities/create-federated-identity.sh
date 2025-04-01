# Variables
RESOURCE_GROUP="rg-ede-labenv"
FED_ID_NAME="GitHub-OIDC"
GITHUB_REPO="ivan-sample-org/terraform-cd" # format: org/repo
AZURE_SUBSCRIPTION_ID="your-tenant-id"
AZURE_TENANT_ID="your-tenant-id"


# Create federated identity

# Function to print colored logs
log() {
  local COLOR=$1
  local MESSAGE=$2
  local RESET="\033[0m"
  echo -e "${COLOR}${MESSAGE}${RESET}"
}

# Define colors
GREEN="\033[0;32m"
YELLOW="\033[0;33m"
BLUE="\033[0;34m"
RED="\033[0;31m"

# Log the start of the script
log $BLUE "Starting the federated identity creation process..."

# Log resource group creation
log $YELLOW "Creating indentity(if it doesn't exist)..."



az identity create \
  --name github-oidc-identity-demo-v1 \
  --resource-group $RESOURCE_GROUP \
  --location centralus

CLIENT_ID=$(az identity show -g $RESOURCE_GROUP -n github-oidc-identity-demo-v1 --query clientId -o tsv)
PRINCIPAL_ID=$(az identity show -g $RESOURCE_GROUP -n github-oidc-identity-demo-v1 --query principalId -o tsv)
IDENTITY_ID=$(az identity show -g $RESOURCE_GROUP -n github-oidc-identity-demo-v1 --query id -o tsv)

log $GREEN "Identity created successfully!"

# Log the client ID
log $GREEN "Client ID: $CLIENT_ID"
log $GREEN "Principal ID: $PRINCIPAL_ID"
log $GREEN "Identity ID: $IDENTITY_ID"
# Log the assignment of permissions
log $YELLOW "Assigning permissions to the identity..."
# Assign permissions (e.g., Contributor on subscription)
az role assignment create \
  --assignee-object-id $PRINCIPAL_ID \
  --assignee-principal-type ServicePrincipal \
  --role "Contributor" \
  --scope /subscriptions/$AZURE_SUBSCRIPTION_ID

  az role assignment create \
  --assignee-object-id $PRINCIPAL_ID \
  --assignee-principal-type ServicePrincipal \
  --role "Owner" \
  --scope /subscriptions/$AZURE_SUBSCRIPTION_ID/resourceGroups/$RESOURCE_GROUP


log $GREEN "Permissions assigned successfully!"
# Log the creation of the federated identity credential
log $YELLOW "Creating federated identity credential..."
# Create federated identity credential
log $GREEN "Federated Identity Name: $FED_ID_NAME"

# Add federated identity credential
az ad app federated-credential create \
  --id $CLIENT_ID \
  --parameters '{
    "name": "'$FED_ID_NAME'",
    "issuer": "https://token.actions.githubusercontent.com",
    "subject": "repo:'$GITHUB_REPO':ref:refs/heads/main",
    "description": "GitHub Actions federated identity",
    "audiences": ["api://AzureADTokenExchange"]
  }'

log $GREEN "Federated identity credential created successfully!"

echo "Setup complete!"
echo "Use the following values in your GitHub Actions secrets:"
echo "AZURE_CLIENT_ID=$CLIENT_ID"
echo "AZURE_TENANT_ID=$TENANT_ID"
echo "AZURE_SUBSCRIPTION_ID=$SUBSCRIPTION_ID"
