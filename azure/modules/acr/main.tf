resource "azurerm_container_registry" "common_acr" {
  name                          = var.acr_name
  resource_group_name           = var.rg_name
  location                      = var.location
  sku                           = var.acr_sku
  admin_enabled                 = var.acr_admin_enabled
  public_network_access_enabled = var.acr_public_network_enabled

  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}