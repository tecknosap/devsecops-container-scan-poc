provider "azurerm" {
  # Configuration options
  features {
    
  }

    subscription_id = var.subscription_id
}

resource "azurerm_resource_group" "rg3" {
  name = var.resource_group
  location = var.location
}