resource "azurerm_user_assigned_identity" "this" {
  name                = var.identity_name
  resource_group_name = var.resource_group_name
  location            = var.location
}

resource "azurerm_user_assigned_identity_federated_identity_credential" "this" {
  name                     = var.federated_credential_name
  user_assigned_identity_id = azurerm_user_assigned_identity.this.id
  audience                 = ["api://AzureADTokenExchange"]
  issuer                   = "https://token.actions.githubusercontent.com"
  subject                  = var.subject
}

resource "azurerm_role_assignment" "this" {
  for_each           = var.role_assignments
  principal_id       = azurerm_user_assigned_identity.this.principal_id
  role_definition_name = each.value.role
  scope              = each.value.scope
}
