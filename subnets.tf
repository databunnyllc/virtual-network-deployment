# Create subnets for virtual network #######
#
#

# Create the gateway subnet

resource "azurerm_subnet" "gateway-subnet" {
  name                 = var.subnet-names[0].gateway_subnet_name
  resource_group_name  = var.resource-group-name
  virtual_network_name = var.company_name
  address_prefixes     = [var.vnet-ip-addresses[0].gateway_subnet_prefix]
}

# Creating the webserver subnet

resource "azurerm_subnet" "webserver-subnet" {
  name                 = var.subnet-names[0].webserver_subnet_name
  resource_group_name  = var.resource-group-name
  virtual_network_name = var.company_name
  address_prefixes     = [var.vnet-ip-addresses[0].webserver_subnet_prefix]
}

# Associate Webserver subnet with nsg

resource "azurerm_subnet_network_security_group_association" "webserver-nsg-asso" {
  subnet_id                 = azurerm_subnet.webserver-subnet.id
  network_security_group_id = azurerm_network_security_group.webserver-subnet-sg.id
}

# Creating the database subnet 

resource "azurerm_subnet" "database-subnet" {
  name                 = var.subnet-names[0].database_subnet_name
  resource_group_name  = var.resource-group-name
  virtual_network_name = var.company_name
  address_prefixes     = [var.vnet-ip-addresses[0].database_subnet_prefix]
}

# Associate Database subnet with nsg

resource "azurerm_subnet_network_security_group_association" "database-nsg-asso" {
  subnet_id                 = azurerm_subnet.database-subnet.id
  network_security_group_id = azurerm_network_security_group.database-subnet-sg.id
}