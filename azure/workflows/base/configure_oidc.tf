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
  scope               = "/subscriptions/${data.azurerm_client_config.current.subscription_id}"
  role_definition_name = "Managed Identity Operator"
  subject             = "repo:${var.github_repo}:ref:refs/heads/${var.branch}"
  
}