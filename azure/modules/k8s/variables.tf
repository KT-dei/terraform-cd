variable "publisher_name" {
  default     = "Ivan Hidalgo"
  description = "The name of the owner of the service"
  type        = string
  validation {
    condition     = length(var.publisher_name) > 0
    error_message = "The publisher_name must contain at least one character."
  }
}

variable "publisher_email" {
  default     = "ivan.hidalgo@rockwellautomation.com"
  description = "The email address of the owner of the service"
  type        = string
  validation {
    condition     = length(var.publisher_email) > 0
    error_message = "The publisher_email must contain at least one character."
  }
}

variable "rg_name" {}
variable "aks_name" {}
variable "location" {}
variable "aks_dns_name" {}

variable "sku_tier" {
  default     = false
  description = "false: Free 99.9 / true: Paid 99.95 SLA"
}

variable "node_pool_vm_size" {
  default = "Standard_E4as_v4"
}

variable "node_pool_vm_size_wks" {
  default = "Standard_E4as_v4"
}
variable "node_pool_vm_size_win" {
  default = "Standard_E4as_v4"
}
variable "docker_bridge_cidr" {
  # The docker_bridge_cidr is required by docker but it’s not used by AKS or Azure.
  # You can use the default: 172.17.0.1/16 as long as it’s not used in the vnet or
  # other connected devices.
  default = "172.17.0.1/16"
}
variable "service_cidr" {
  default = "10.240.0.0/16"
}
variable "dns_service_ip" {
  # dns_service_ip is usually the 10th ip of the service_cidr which is 10.240.0.0/16 above
  default = "10.240.0.10"
}

variable "api_server_authorized_ip_ranges" {
  type    = list(string)
  default = [""]
}
variable "max_pods" {
  default = 75
}
variable "max_pods_wks" {
  default = 50
}
variable "max_pods_win" {
  default = 50
}
variable "windows_support" {
  default = false
}
variable "win_node_pool_name" {
  default = "winnp"
}

variable "base_manage" {
  default = false
}
variable "linux_wks_node_pool_name" {
  default = "linuxnpwks"
}
variable "kubernetes_version" {
  default = "1.31.3"
}

########## Default node pool ##########
variable "node_pool_name" {}
variable "node_pool_count" {}
variable "os_disk_size_gb" {
  default = 64
  type    = number
}
variable "os_disk_size_gb_wks" {
  default = 64
  type    = number
}
variable "os_disk_size_gb_win" {
  default = 150
  type    = number
}
variable "os_sku_win" {
  default = "Windows2019"
  type    = string
}
variable "node_pool_type" {}
variable "node_pool_availability_zone" {}
variable "node_pool_max_count" {}
variable "node_pool_min_count" {}

variable "tags" {
  default = {
    "ApplicationName"    = "labs Cloud Services"
    "ApplicationTag"     = "lan=bs Cloud"
    "Capability"         = "Network and Cloud Services"
    "DataClassification" = "Confidential"
    "Environment"        = "Sandbox"
    "Lifespan"           = "Months"
    "OwnerEmail"         = "ivanhidalgo22@gmail.com"
    "ProjectInitiative"  = "Default Project"
    "ServiceClass"       = "User Managed"
  }
}