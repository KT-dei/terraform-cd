output "redis_cache_hostname" {
  description = "Hostname of the Azure Redis Cache instance"
  value       = azurerm_redis_cache.redis_cache.hostname
}

output "redis_cache_ssl_port" {
  description = "SSL Port number of Redis Cache"
  value       = azurerm_redis_cache.redis_cache.ssl_port
}

output "redis_cache_primary_access_key" {
  description = "Primary access key for Redis Cache"
  value       = azurerm_redis_cache.redis_cache.primary_access_key
  sensitive   = true
}
output "redis_cache_secondary_access_key" {
  description = "Secondary access key for Redis Cache"
  value       = azurerm_redis_cache.redis_cache.secondary_access_key
  sensitive   = true
}
