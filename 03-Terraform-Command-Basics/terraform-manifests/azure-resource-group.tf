# Terraform Settings Block
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.32.0" # this is optional but recommended on production
    }
  }
}

# terraform {
#   required_version = ">= 1.0.0" # this is not present on other versions
#   required_providers {
#     azurerm = {
#       source = "hashicorp/azurerm"
#       version = ">= 2.0" # Optional but recommended in production
#     }    
#   }
# }

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

# Create Resource Group 
resource "azurerm_resource_group" "my_demo_rg1" {
  location = "eastus"
  name = "rg-ss-demo01"
}
