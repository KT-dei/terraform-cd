variable "rg_name" {}
variable "cosmosdb_account_name" {
  
}
variable "resource_group_name" {
  description = "Name of the Azure resource group."
  type        = string
}

variable "location" {
  description = "Azure region where Cosmos DB resources will be created."
  type        = string
  default     = "Central US"
}

variable "cosmosdb_account_prefix" {
  description = "Prefix for the Azure Cosmos DB account name."
  type        = string
  default     = "cosmos-mongo"
}

variable "mongo_database_name" {
  description = "Name of the MongoDB database."
  type        = string
  default     = "mydb"
}

variable "database_throughput" {
  description = "Provisioned throughput (RU/s) for the database."
  type        = number
  default     = 400
}
variable "enable_private_network_access" {
  description = "Enable private network access for the Cosmos DB account."
  type        = bool
  default     = false
}
variable "enable_public_network_access" {
  description = "Enable public network access for the Cosmos DB account."
  type        = bool
  default     = true
}
variable "enable_mongo_api" {
  description = "Enable MongoDB API for the Cosmos DB account."
  type        = bool
  default     = true
}
variable "enable_geo_redundancy" {
  description = "Enable geo-redundancy for the Cosmos DB account."
  type        = bool
  default     = false
}