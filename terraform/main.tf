terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.40.0"
    }
  }
}

provider "azurerm" {
  # Configuration options
  features {
    
  }

    subscription_id = var.subscription_id
}

resource "azurerm_resource_group" "rg1" {
  name = var.resource_group
  location = var.location
}