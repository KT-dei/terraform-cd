# Random suffix for MySQL server
resource "random_string" "mysql_server_name_suffix" {
  length  = 5
  special = false
  upper   = false
}



resource "azurerm_resource_group" "mysql_rg" {
  name     = var.rg_name
  location = var.location
}

resource "azurerm_mysql_flexible_server" "mysql_server" {
  name                   = var.mysql_server_name
  resource_group_name    = azurerm_resource_group.mysql_rg.name
  location               = azurerm_resource_group.mysql_rg.location
  administrator_login    = var.admin_username
  administrator_password = var.admin_password
  sku_name               = var.sku_name
  version                 = var.mysql_version
  zone = "1"
  storage {
    size_gb = 20
  }
  backup_retention_days  = 7
  geo_redundant_backup_enabled = false

  #high_availability {
    #mode = "Disabled"
  #}
}

resource "azurerm_mysql_flexible_database" "mysql_db" {
  name                = var.database_name
  resource_group_name = azurerm_resource_group.mysql_rg.name
  server_name         = azurerm_mysql_flexible_server.mysql_server.name
  charset             = "utf8"
  collation           = "utf8_unicode_ci"
}
