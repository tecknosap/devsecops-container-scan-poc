terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.40.0"
    }
  }
}
provider "azurerm" {
  features {}
  use_oidc = true
}

resource "azurerm_resource_group" "rg1" {
  name = var.resource_group
  location = var.location
}