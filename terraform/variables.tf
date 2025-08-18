variable "resource_group" {
  
  description = "main resource group"
  type = string
  default = "gocloudops-rg4"
}


variable "location" {
  
  description = "main resource group location"
  type = string
  default = "eastus"
}

variable "subscription_id" {
    description = "place holder for our subscription"
    type = string  ######
}

variable "storage_account_name" {
  description = "storage name account"
  type = string
  default     = "gocloudopst1234chl"
  
}

