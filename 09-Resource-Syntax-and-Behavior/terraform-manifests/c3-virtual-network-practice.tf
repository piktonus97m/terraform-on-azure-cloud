# Resource 2: Create a Virtual Networks
# Reference: https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network

resource "azurerm_virtual_network" "xorg-consulting-stage-vnet" {
  name = "xorg-consulting-stage-vnet-01"
  location = azurerm_resource_group.xorg_consulting_stage.location
  resource_group_name = azurerm_resource_group.xorg_consulting_stage.name
  address_space = [ "10.0.0.0/16" ]
  tags = {
    "Name" = "xorg-consulting-stage-vnet-01",
    "Environment" = "Dev"
  }
}

# Resource 3: Create a Subnet

resource "azurerm_subnet" "xorg-consulting-stage-subnet" {
  name = "xorg-consulting-stage-subnet-01"
  resource_group_name = azurerm_resource_group.xorg_consulting_stage.name
  virtual_network_name = azurerm_virtual_network.xorg-consulting-stage-vnet.name
  address_prefixes = [ "10.0.2.0/24" ]
}

# Resource 4: Create a Public IP address

resource "azurerm_public_ip" "xorg-consulting-stage-publicip" {
  name = "xorg-consulting-stage-publicip-01"
  resource_group_name = azurerm_resource_group.xorg_consulting_stage.name
  location = azurerm_resource_group.xorg_consulting_stage.location
  allocation_method = "Static"
  tags = { #This is map, since it has = sign.
    "Environment" = "Stage"
  }
}

# Resource 5: Create a Network Interface

resource "azurerm_network_interface" "xorg-consulting-stage-nic" {
  name = "xorg-consulting-stage-nic-01"
  resource_group_name = azurerm_resource_group.xorg_consulting_stage.name
  location = azurerm_resource_group.xorg_consulting_stage.location
  ip_configuration { # This is internal block since it does not have the = sign.
    name = "internal"
    subnet_id = azurerm_subnet.xorg-consulting-stage-subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.xorg-consulting-stage-publicip.id
  }
}