variable "identity_name" {
  description = "Name of the Managed Identity"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group where the identity will live"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "federated_credential_name" {
  description = "Name for the federated identity credential"
  type        = string
}

variable "subject" {
  description = "Subject string from GitHub Actions OIDC token"
  type        = string
}

variable "role_assignments" {
  description = "Map of role assignments"
  type = map(object({
    role  = string
    scope = string
  }))
  default = {}
}
