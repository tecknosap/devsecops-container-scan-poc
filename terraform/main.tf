provider "azurerm" {
  # Configuration options
  features {
    
  }

    subscription_id = var.subscription_id
}

resource "azurerm_resource_group" "rg4" {
  name = var.resource_group
  location = var.location
}

resource "azurerm_storage_account" "ghb" {
  name = var.storage_account_name
  resource_group_name = azurerm_resource_group.rg4.name
  location = azurerm_resource_group.rg4.location
   account_tier             = "Standard"
  account_replication_type = "LRS"
  
}

resource "azurerm_storage_container" "container" {
  name = var.container_name
  storage_account_name = azurerm_storage_account.ghb.name
   container_access_type = "private"
}




