resource "azurerm_user_assigned_identity" "this" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_federated_identity_credential" "this" {
  name                = "${var.name}"
  resource_group_name = var.resource_group_name
  audience            = ["api://AzureADTokenExchange"]
  issuer              = "https://token.actions.githubusercontent.com"
  subject             = "repo:${var.github_repo}:ref:refs/heads/${var.branch}"
  # description attribute removed as it is not supported
  parent_id           = azurerm_user_assigned_identity.this.id
  depends_on          = [azurerm_user_assigned_identity.this]

}

resource "azurerm_role_assignment" "this" {
  scope                = var.scope
  role_definition_name = var.role_definition_name
  principal_id         = azurerm_user_assigned_identity.this.principal_id
}
