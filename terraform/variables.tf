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
    description = "place holder for our subscription"
    type = string  
}