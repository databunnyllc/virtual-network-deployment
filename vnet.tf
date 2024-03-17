# Create virtual network

resource "azurerm_virtual_network" "main-vnet" {
  name                = var.company_name
  address_space       = [var.vnet-ip-addresses[0].addresses_space]
  location            = var.locations[0].north_central_us
  resource_group_name = var.resource-group-name
}

