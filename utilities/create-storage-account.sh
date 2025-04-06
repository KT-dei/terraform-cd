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

# Variables
RESOURCE_GROUP="terraform-rg" # Change this to your desired resource group name
STORAGE_ACCOUNT_NAME="tfstate$RANDOM"  # Must be globally unique
CONTAINER_NAME="tfstate"

log $BLUE "Starting the storage account creation process..."
log $YELLOW "Creating resource group if it doesn't exist..."
# Create resource group
az group create --name $RESOURCE_GROUP --location centralus

# Check if the storage account already exists
EXISTING_ACCOUNT=$(az storage account check-name --name $STORAGE_ACCOUNT_NAME --query "nameAvailable" -o tsv)
if [ "$EXISTING_ACCOUNT" == "false" ]; then
  log $RED "Storage account name $STORAGE_ACCOUNT_NAME is already taken. Please choose a different name."
  exit 1
fi
log $YELLOW "Creating storage account..."

# Create storage account
az storage account create \
  --name $STORAGE_ACCOUNT_NAME \
  --resource-group $RESOURCE_GROUP \
  --location centralus \
  --sku Standard_LRS \
  --encryption-services blob

# Get access key
ACCOUNT_KEY=$(az storage account keys list \
  --resource-group $RESOURCE_GROUP \
  --account-name $STORAGE_ACCOUNT_NAME \
  --query '[0].value' -o tsv)

# Create container
az storage container create \
  --name $CONTAINER_NAME \
  --account-name $STORAGE_ACCOUNT_NAME \
  --account-key $ACCOUNT_KEY

# Output the storage account details
log $GREEN "Storage account created successfully!"
log $GREEN "Storage Account Name: $STORAGE_ACCOUNT_NAME"
log $GREEN "Resource Group: $RESOURCE_GROUP"
log $GREEN "Container Name: $CONTAINER_NAME"
log $GREEN "You can now use this storage account for Terraform state management."
log $GREEN "Process completed successfully!"