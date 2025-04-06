terraform {
  required_version = ">= 0.14"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.3.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.6.0"
    }
  }

}
