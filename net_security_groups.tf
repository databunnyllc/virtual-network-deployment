# Create security group for public subnets

resource "azurerm_network_security_group" "webserver-subnet-sg" {
  name                = var.security-groups[0]
  location            = azurerm_resource_group.webservers-rg.location
  resource_group_name = azurerm_resource_group.webservers-rg.name

  # Create name for security group
  tags = {
    Name = "Webserver Subnet SG"
  }
}

# Create security group for database subnets

resource "azurerm_network_security_group" "database-subnet-sg" {
  name                = var.security-groups[1]
  location            = azurerm_resource_group.webservers-rg.location
  resource_group_name = azurerm_resource_group.webservers-rg.name

  # Create name for security group
  tags = {
    Name = "Database Subnet SG"
  }
}