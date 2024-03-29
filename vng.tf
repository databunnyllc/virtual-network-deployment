# The virtual network gateway

resource "azurerm_virtual_network_gateway" "vng" {
  name                = "virtual-network-gateway"
  location            = var.locations[0].east_us
  resource_group_name = var.resource-group-name

  type     = "Vpn"
  vpn_type = "RouteBased"

  active_active = true
  enable_bgp    = false
  sku           = "VpnGw3"
  generation    = "Generation2"

  ip_configuration {
    name                          = "vnetGatewayConfig"
    public_ip_address_id          = azurerm_public_ip.vng-public-ip.id
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = azurerm_subnet.gateway-subnet.id
  }

  ip_configuration {
    name                          = "vnetGatewayConfig2"
    public_ip_address_id          = azurerm_public_ip.vng-public-ip-2.id
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = azurerm_subnet.gateway-subnet.id
  }
}