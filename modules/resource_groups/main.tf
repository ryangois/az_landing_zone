# Connectivity subscription
resource "azurerm_resource_group" "connectivity_hub" {
  name     = var.rg_connectivity_hub_name
  location = var.location

   provider = azurerm.connectivity
}

# Management subscription
resource "azurerm_resource_group" "management_monitor" {
  name            = var.rg_management_monitor_name
  location        = var.location
  subscription_id = var.subscription_management_id
   provider = azurerm.management
}

# Identity subscription
resource "azurerm_resource_group" "identity" {
  name            = var.rg_identity_name
  location        = var.location
  subscription_id = var.subscription_identity_id
  provider = azurerm.identity
}

# Corp subscription
resource "azurerm_resource_group" "corp_production" {
  name            = var.rg_corp_production_name
  location        = var.location
  subscription_id = var.subscription_corp_id
  provider = azurerm.corp
}

# Sandbox subscription
resource "azurerm_resource_group" "sandbox" {
  name            = var.rg_sandbox_name
  location        = var.location
  subscription_id = var.subscription_sandbox_id
  provider = azurerm.sandbox
}
