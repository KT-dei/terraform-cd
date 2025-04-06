variable "name" {
  description = "Name of the managed identity"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "resource_group_name" {
  description = "Azure resource group name"
  type        = string
}

variable "github_repo" {
  description = "GitHub repo in format org/repo"
  type        = string
}

variable "branch" {
  description = "Branch name to trust"
  type        = string
}

variable "scope" {
  description = "Scope for role assignment"
  type        = string
}

variable "role_definition_name" {
  description = "Azure role name (e.g., Contributor, Reader)"
  type        = string
}
variable "subject" {
  description = "Subject for federated identity credential"
  type        = string
}

variable "storage_account_blob_scope" {
  description = "Scope for assigning Storage Blob Data Contributor (e.g. storage account or container)"
  type        = string
  default     = null
}

variable "resource_group_scope" {
  description = "Scope for assigning Reader role (typically the RG containing the backend)"
  type        = string
  default     = null
}

