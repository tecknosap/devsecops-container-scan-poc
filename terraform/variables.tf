variable "resource_group" {
  
  description = "main resource group"
  type = string
  default = "gocloudops-rg1"
}


variable "location" {
  
  description = "main resource group location"
  type = string
  default = "eastus"
}

variable "subscription_id" {

    type = string
    #default = "6412cc8a-685f-44b5-bdf8-456a7b8d1f65"
  
}