terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = " 4.28.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "demo-storageaccount-rg"
  location = "East US"
}

resource "azurerm_storage_account" "example" {
  name                     = "storageaccount14534"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}