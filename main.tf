terraform {
  # each project needs a unique key
  backend "azurerm" {
    # use -backend-config flags to init with
    resource_group_name  = ""
    storage_account_name = ""
    container_name       = ""
    key                  = ""
    subscription_id      = ""
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.55.0"
    }
  }
  # do not go over 1.5.5 see https://jira.kroger.com/jira/browse/FFILLSVCS-44272
  required_version = ">= 0.14, <= 1.5.5"
}

provider "azurerm" {
    features {}
}

resource "azurerm_virtual_network" "example" {
  name                = "example-network"
  location            = "eastus2"
  resource_group_name = "rg-merchex-sanda91-eastus2"
  address_space       = ["10.0.0.0/16"]
}
