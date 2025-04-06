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

resource "azurerm_role_assignment" "main_assignment" {
  scope                = var.scope
  role_definition_name = var.role_definition_name
  principal_id         = azurerm_user_assigned_identity.this.principal_id
}

resource "azurerm_role_assignment" "blob_data_contributor" {
  count                = var.storage_account_blob_scope != null ? 1 : 0
  scope                = var.storage_account_blob_scope
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = azurerm_user_assigned_identity.this.principal_id
}

resource "azurerm_role_assignment" "rg_reader" {
  count                = var.resource_group_scope != null ? 1 : 0
  scope                = var.resource_group_scope
  role_definition_name = "Reader"
  principal_id         = azurerm_user_assigned_identity.this.principal_id
}
