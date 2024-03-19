# The virtual network gateway public IP address

resource "azurerm_public_ip" "vng-public-ip" {
  name                = "vng-public-ip"
  location            = var.locations[0].north_central_us
  resource_group_name = var.resource-group-name

  allocation_method = "Dynamic"
}