
# Create gateway security group

resource "azurerm_network_security_group" "gateway-subnet-sg" {
  name                = var.security-groups[0]
  location            = var.locations[0].north_central_us
  resource_group_name = var.resource-group-name

  # Allow all traffic inbound

  security_rule {
    name                       = "allow-all-inbound"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  # Create name for security group

  tags = {
    Name = "Gateway Subnet SG"
  }
}

# Associate gateway subnet network security group to gateway subnet 

resource "azurerm_subnet_network_security_group_association" "associate-sg-gatewaySubnet" {
  subnet_id                 = azurerm_subnet.gateway-subnet.id
  network_security_group_id = azurerm_network_security_group.gateway-subnet-sg.id
}

# Create security group for public subnets

resource "azurerm_network_security_group" "webserver-subnet-sg" {
  name                = var.security-groups[1]
  location            = var.locations[0].north_central_us
  resource_group_name = var.resource-group-name

  # Create name for security group
  tags = {
    Name = "Webserver Subnet SG"
  }
}

# Create security group for database subnets

resource "azurerm_network_security_group" "database-subnet-sg" {
  name                = var.security-groups[2]
  location            = var.locations[0].north_central_us
  resource_group_name = azurerm_resource_group.webservers-rg.name

  # Create name for security group
  tags = {
    Name = "Database Subnet SG"
  }
}