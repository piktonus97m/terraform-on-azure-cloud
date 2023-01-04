# Resource block
# Create a resource group

resource "azurerm_resource_group" "myresourcegroup" {
  name = "myresourcegroup1"
  location = "East US"
}