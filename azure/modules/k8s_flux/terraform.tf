terraform {
  required_version = ">= 0.14"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.3.0"  # Pick one, preferably latest stable
    }
  }
}
