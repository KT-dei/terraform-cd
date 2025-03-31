resource "azurerm_resource_group" "cosmosdb_rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "random_string" "cosmosdb_suffix" {
  length  = 5
  special = false
  upper   = false
}

resource "azurerm_cosmosdb_account" "mongo_cosmosdb" {
  name                = var.cosmosdb_account_name
  location            = azurerm_resource_group.cosmosdb_rg.location
  resource_group_name = azurerm_resource_group.cosmosdb_rg.name
  offer_type          = "Standard"
  kind                = "MongoDB"

  consistency_policy {
    consistency_level = "Session"
  }

  geo_location {
    location          = azurerm_resource_group.cosmosdb_rg.location
    failover_priority = 0
  }

  capabilities {
    name = "EnableMongo"
  }

  backup {
    type                = "Periodic"
    interval_in_minutes = 240
    retention_in_hours  = 8
    storage_redundancy  = "Local"
  }
}

resource "azurerm_cosmosdb_mongo_database" "mongo_database" {
  name                = var.mongo_database_name
  resource_group_name = azurerm_resource_group.cosmosdb_rg.name
  account_name        = azurerm_cosmosdb_account.mongo_cosmosdb.name
  throughput          = var.database_throughput
}
