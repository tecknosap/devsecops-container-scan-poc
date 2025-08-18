provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

# ===============================
# Create an Azure Container Registry (ACR) in the specified resource group and region
# ===============================
resource "azurerm_container_registry" "acr" {
  name                = "tecknoacr"
  location            = var.location
  resource_group_name = var.resource_group
  sku                 = "Basic"
  admin_enabled       = false
}