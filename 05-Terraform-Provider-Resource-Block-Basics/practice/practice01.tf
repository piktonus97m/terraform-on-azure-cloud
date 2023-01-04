terraform {
  required_version = ">= 1.0.0"
  
  # Required Providers block
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.37.0"
    }
  }
}

  # Provider block
provider "azurerm" {
  features {}
}