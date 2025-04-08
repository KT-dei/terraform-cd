terraform {
  backend "azurerm" {
    resource_group_name  = "terraform-rg"
    storage_account_name = "tfstate26035"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
    subscription_id      = "fd95eef5-ba7d-4f3a-bdc0-1d012014be02"

  }
}