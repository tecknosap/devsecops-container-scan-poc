terraform {
  backend "azurerm" {
    resource_group_name   = "rg-gocloudops-terraform-backend"
    storage_account_name  = "gocloudopstfstate"
    container_name        = "tfstate"
    key                   = "devsecops-poc2.tfstate"
    arm_use_oidc         = true 
  }
}
