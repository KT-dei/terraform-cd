variable "rg_name" {}
variable "resource_group_name" {
  description = "Name of the Azure resource group"
  type        = string
  default = "value"
}

variable "location" {
  description = "Azure region where resources will be created"
  type        = string
  default     = "East US"
}

variable "mysql_server_name" {
  description = "Name of the Azure MySQL Flexible server"
  type        = string
}

variable "admin_username" {
  description = "MySQL administrator username"
  type        = string
}

variable "admin_password" {
  description = "MySQL administrator password"
  type        = string
  sensitive   = true
}

variable "mysql_version" {
  description = "MySQL engine version"
  type        = string
  default     = "8.0.21"
}

variable "database_name" {
  description = "Initial MySQL database name"
  type        = string
}
variable "sku_name" {
  description = "SKU name for the MySQL server"
  type        = string
  default     = "Standard_B1ms"
}
variable "tags" {
  description = "Tags to be applied to the resources"
  type        = map(string)
  default     = {}
}
variable "enable_public_network_access" {
  description = "Enable public network access for the MySQL server"
  type        = bool
  default     = true
}
variable "enable_private_network_access" {
  description = "Enable private network access for the MySQL server"
  type        = bool
  default     = false
}
variable "private_dns_zone_name" {
  description = "Private DNS zone name for the MySQL server"
  type        = string
  default     = "privatelink.mysql.database.azure.com"
}
variable "private_dns_zone_rg_name" {
  description = "Resource group name for the private DNS zone"
  type        = string
  default     = "myPrivateDNSZoneRG"
}
variable "private_dns_zone_rg_location" {
  description = "Location of the resource group for the private DNS zone"
  type        = string
  default     = "East US"
}
variable "private_dns_zone_rg_tags" {
  description = "Tags for the resource group of the private DNS zone"
  type        = map(string)
  default     = {}
}