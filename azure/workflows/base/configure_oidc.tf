# Configure OIDC for GitHub Actions to Azure AD
# This Terraform script configures a federated identity credential for GitHub Actions to authenticate with Azure AD.
# It creates a user-assigned managed identity and assigns it a role in Azure.

module "github-oidc-uami" {
  source = "../../modules/github-oidc-uami"

  name                = var.oidc_name
  location            = var.location
  resource_group_name = local.rg_k8s
  github_repo         = var.github_repo
  branch              = var.branch
  scope               = "/subscriptions/${var.azure_subscription_id_global}"
  role_definition_name = "Managed Identity Operator"
  subject             = "repo:${var.github_repo}:ref:refs/heads/${var.branch}"
  storage_account_blob_scope = "/subscriptions/${var.azure_subscription_id_global}/resourceGroups/${var.tfstate_rg}/providers/Microsoft.Storage/storageAccounts/${var.tfstate_storage_account_name}"
  resource_group_scope = "/subscriptions/${var.azure_subscription_id_global}/resourceGroups/${var.tfstate_rg}"
  
}