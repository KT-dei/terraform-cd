output "cosmosdb_account_endpoint" {
  description = "Endpoint URL of the Cosmos DB Mongo account."
  value       = azurerm_cosmosdb_account.mongo_cosmosdb.endpoint
}

output "mongo_database_name" {
  description = "Name of the created MongoDB database."
  value       = azurerm_cosmosdb_mongo_database.mongo_database.name
}

output "primary_connection_string" {
  description = "Primary MongoDB connection string."
  value       = azurerm_cosmosdb_account.mongo_cosmosdb.connection_strings[0]
  sensitive   = true
}
output "secondary_connection_string" {
  description = "Secondary MongoDB connection string."
  value       = azurerm_cosmosdb_account.mongo_cosmosdb.connection_strings[1]
  sensitive   = true
}
output "mongo_database_id" {
  description = "ID of the created MongoDB database."
  value       = azurerm_cosmosdb_mongo_database.mongo_database.id
}
output "mongo_database_throughput" {
  description = "Provisioned throughput (RU/s) for the MongoDB database."
  value       = azurerm_cosmosdb_mongo_database.mongo_database.throughput
}
output "mongo_database_resource_id" {
  description = "Resource ID of the MongoDB database."
  value       = azurerm_cosmosdb_mongo_database.mongo_database.id
}