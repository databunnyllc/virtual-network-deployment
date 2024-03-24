# Create the main resource group for our deployment 
# Resource group name: webservers.rg, us-east-1

resource "azurerm_resource_group" "webservers-rg" {
  name     = var.resource-group-name
  location = var.locations[0].east_us
}