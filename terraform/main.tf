provider "azurerm" {
  features {}

  use_oidc = true
  client_id       = var.client_id
  tenant_id       = var.tenant_id
  subscription_id = var.subscription_id
}

resource "azurerm_resource_group" "rg3" {
  name = var.resource_group
  location = var.location
}