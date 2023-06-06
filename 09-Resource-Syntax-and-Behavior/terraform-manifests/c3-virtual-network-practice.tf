# Resource 2: Create a Virtual Networks
# Reference: https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network

resource "azurerm_virtual_network" "name" {
    name = "xorg-consulting-stage-vnet-01"
    location = azurerm_resource_group.xorg_consulting_stage.location
    resource_group_name = azurerm_resource_group.xorg_consulting_stage.name
    address_space = [ "10.0.0.0/16" ]
    tags = {
      "Name" = "xorg-consulting-stage-vnet-01"
    }
}

# Resource 3: Create a Subnet

resource "azurerm_subnet" "xorg-consulting-stage-subnet-01" {
    name = "xorg-consulting-stage-subnet-01"
}

# Resource 4: Create a Public IP address
# Resource 5: Create a Network Interface

