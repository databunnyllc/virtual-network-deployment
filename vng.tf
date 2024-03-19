# The virtual network gateway

resource "azurerm_virtual_network_gateway" "vng" {
  name                = "virtual-network-gateway"
  location            = var.locations[0].north_central_us
  resource_group_name = var.resource-group-name

  type     = "Vpn"
  vpn_type = "RouteBased"

  active_active = false
  enable_bgp    = false
  sku           = "Basic"

  ip_configuration {
    name                          = "vnetGatewayConfig"
    public_ip_address_id          = azurerm_public_ip.vng-public-ip.id
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = azurerm_subnet.gateway-subnet.id
  }

  vpn_client_configuration {
    address_space = ["10.2.0.0/24"]
  }
}