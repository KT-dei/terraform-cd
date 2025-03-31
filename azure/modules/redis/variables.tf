variable "redis_cache_name" {}
variable "rg_name" {}

variable "resource_group_name" {
  description = "Name of the Azure resource group"
  type        = string
}

variable "location" {
  description = "Azure region for Redis Cache"
  type        = string
  default     = "East US"
}

variable "redis_cache_name_prefix" {
  description = "Prefix for the Azure Redis Cache name"
  type        = string
  default     = "redis-cache"
}

variable "sku_name" {
  description = "Redis Cache SKU name (Basic, Standard, Premium)"
  type        = string
  default     = "Basic"
}

variable "family" {
  description = "SKU family (C for Basic/Standard, P for Premium)"
  type        = string
  default     = "C"
}

variable "capacity" {
  description = "Redis Cache capacity (0-6, where 0 is 250MB, 1 is 1GB, etc.)"
  type        = number
  default     = 0
}
variable "enable_non_ssl_port" {
  description = "Enable non-SSL port (6379) for Redis Cache"
  type        = bool
  default     = false
}
variable "minimum_tls_version" {
  description = "Minimum TLS version for Redis Cache"
  type        = string
  default     = "1.2"
}
variable "redis_cache_subnet_id" {
  description = "Subnet ID for Redis Cache (if using a virtual network)"
  type        = string
  default     = null
}
variable "redis_cache_private_endpoint_id" {
  description = "Private endpoint ID for Redis Cache (if using a private endpoint)"
  type        = string
  default     = null
}
variable "redis_cache_private_dns_zone_id" {
  description = "Private DNS zone ID for Redis Cache (if using a private endpoint)"
  type        = string
  default     = null
}
variable "redis_cache_tags" {
  description = "Tags for Redis Cache resources"
  type        = map(string)
  default     = {}
}