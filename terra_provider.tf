terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.77.0"
}
}
}
provider "azurerm" {
  # Configuration options
}
# Create a resource group
resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "West Europe"
}

# Create a virtual network within the resource group
resource "azurerm_virtual_network" "example" {
  name                = "example-network"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  address_space       = ["10.0.0.0/16"]
}

module "tier1" {
  source = "https://github.com/MedhaJoshi37/kpmg/blob/main/tier1.tf"
  resource_group_name = azurerm_resource_group.example.name
  location = azurerm_resource_group.example.location

}
module "tier2" {
  source = "https://github.com/MedhaJoshi37/kpmg/blob/main/tier2.tf"
  resource_group_name = azurerm_resource_group.example.name
  location = azurerm_resource_group.example.location

}

module "tier3" {
  source = "https://github.com/MedhaJoshi37/kpmg/blob/main/tier3.tf"
  resource_group_name = azurerm_resource_group.example.name
  location = azurerm_resource_group.example.location
}
                                            
                           
