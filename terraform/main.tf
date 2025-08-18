provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}



resource "azurerm_resource_group" "rg" {
  name = var.resource_group
  location = var.location
  
}
# ===============================
# Create an Azure Container Registry (ACR) in the specified resource group and region
# ===============================
resource "azurerm_container_registry" "acr" {
  name                = "tecknoacr"
  location            = azurerm_resource_group.rg.name
  resource_group_name = azurerm_resource_group.rg.location
  sku                 = "Basic"
  admin_enabled       = false
}