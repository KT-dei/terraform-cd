output "mysql_server_fqdn" {
  description = "FQDN of the Azure MySQL instance"
  value       = azurerm_mysql_flexible_server.mysql_server.fqdn
}

output "database_name" {
  description = "MySQL database name"
  value       = azurerm_mysql_flexible_database.mysql_db.name
}

output "administrator_login" {
  description = "MySQL administrator username"
  value       = azurerm_mysql_flexible_server.mysql_server.administrator_login
}
output "mysql_server_id" {
  description = "ID of the Azure MySQL instance"
  value       = azurerm_mysql_flexible_server.mysql_server.id
}
output "mysql_server_name" {
  description = "Name of the Azure MySQL instance"
  value       = azurerm_mysql_flexible_server.mysql_server.name
}