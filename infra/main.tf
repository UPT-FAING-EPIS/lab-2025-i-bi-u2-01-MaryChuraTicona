terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "rg-datos-multidimensional"
  location = "westus2"
}

resource "azurerm_sql_server" "sqlserver" {
  name                         = "sqlservermultidimensional"
  resource_group_name          = azurerm_resource_group.rg.name
  location                     = azurerm_resource_group.rg.location
  version                      = "12.0"
  administrator_login          = "adminsql"
  administrator_login_password = "Terraform2024!"
}

resource "azurerm_sql_database" "sqldb1" {
  name                = "modelo01"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  server_name         = azurerm_sql_server.sqlserver.name
  requested_service_objective_name = "Basic"
}

resource "azurerm_sql_database" "sqldb2" {
  name                = "modelo02"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  server_name         = azurerm_sql_server.sqlserver.name
  requested_service_objective_name = "Basic"
}

resource "azurerm_sql_database" "sqldb3" {
  name                = "modelo03"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  server_name         = azurerm_sql_server.sqlserver.name
  requested_service_objective_name = "Basic"
}
