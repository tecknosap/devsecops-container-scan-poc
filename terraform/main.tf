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

resource "azurerm_storage_account" "name" {
  name = var.storage_account_name
  resource_group_name = azurerm_resource_group.rg3.name
  location = azurerm_resource_group.rg3.location
   account_tier             = "Standard"
  account_replication_type = "LRS"
  
}# test


