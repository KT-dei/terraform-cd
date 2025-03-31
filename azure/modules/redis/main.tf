resource "azurerm_resource_group" "redis_rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "random_string" "redis_suffix" {
  length  = 5
  special = false
  upper   = false
}


resource "azurerm_redis_cache" "redis_cache" {
  name                = var.redis_cache_name
  location            = azurerm_resource_group.redis_rg.location
  resource_group_name = azurerm_resource_group.redis_rg.name
  capacity            = var.capacity
  family              = var.family
  sku_name            = var.sku_name
  enable_non_ssl_port = false
  minimum_tls_version = "1.2"
}


