# The virtual network gateway public IP address

resource "azurerm_public_ip" "vng-public-ip" {
  name                = "vng-public-ip"
  location            = var.locations[0].east_us
  resource_group_name = var.resource-group-name

  allocation_method = "Dynamic"
}

resource "azurerm_public_ip" "vng-public-ip-2" {
  name                = "vng-public-ip-secondary"
  location            = var.locations[0].east_us
  resource_group_name = var.resource-group-name

  allocation_method = "Dynamic"
}