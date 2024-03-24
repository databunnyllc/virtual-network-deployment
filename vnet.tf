# Create virtual network

resource "azurerm_virtual_network" "Daves_Construction" {
  name                = var.company_name
  address_space       = [var.vnet-ip-addresses[0].addresses_space]
  location            = var.locations[0].east_us
  resource_group_name = var.resource-group-name
}

