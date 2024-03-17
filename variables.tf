# Company Name

variable "company_name" {
  type    = string
  default = "World Construction Inc"
}

# US and Canada AZs

variable "locations" {
  type = list(object({
    east_us          = string
    east_us_2        = string
    north_central_us = string
    canada_east      = string
  }))
  default = [{
    east_us          = "East US"
    east_us_2        = "East US 2"
    north_central_us = "North Central US"
    canada_east      = "Canada East"
  }]
}

# Resource Group Name

variable "resource-group-name" {
  type    = string
  default = "webserver-rg-lab01"
}

# Network Security Groups 

variable "security-groups" {
  type = list(string)
  default = [
    "webserver-subnet-sg",
    "database-subnet-sg"
  ]
}

# Virtual Network IPs

variable "vnet-ip-addresses" {
  description = "The ip addresses used in the VNET."
  type = list(object({
    addresses_space         = string
    webserver_subnet_prefix = string
    database_subnet_prefix  = string
  }))
  default = [{
    addresses_space         = "10.0.0.0/16"
    webserver_subnet_prefix = "10.0.1.0/24"
    database_subnet_prefix  = "10.0.2.0/24"
  }]
}

variable "subnet-names" {
  type = list(object({
    webserver_subnet_name = string
    database_subnet_name  = string
  }))
  default = [{
    webserver_subnet_name = "webserver-subnet"
    database_subnet_name  = "database-subnet"
  }]
}