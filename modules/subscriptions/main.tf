locals {
  # Example subscription display names if you want to create them
  subscription_identity_display_name     = "Identity Subscription"
  subscription_connectivity_display_name = "Connectivity Subscription"
  subscription_management_display_name   = "Management Subscription"
  subscription_corp_display_name         = "Corp Landing Zone Subscription"
  subscription_sandbox_display_name      = "Sandbox Landing Zone Subscription"
}

# -------------------------------------------------------------------
# Optionally create new subscriptions (requires an Enrollment Account).
# By default set to false. 
# -------------------------------------------------------------------

# Connectivity subscription
resource "azurerm_resource_group" "connectivity_hub" {
  provider = azurerm.connectivity
  name     = var.rg_connectivity_hub_name
  location = var.location
}

# Management subscription
resource "azurerm_resource_group" "management_monitor" {
  provider = azurerm.management
  name     = var.rg_management_monitor_name
  location = var.location
}

# Identity subscription
resource "azurerm_resource_group" "identity" {
  provider = azurerm.identity
  name     = var.rg_identity_name
  location = var.location
}

# Corp subscription
resource "azurerm_resource_group" "corp_production" {
  provider = azurerm.corp
  name     = var.rg_corp_production_name
  location = var.location
}

# Sandbox subscription
resource "azurerm_resource_group" "sandbox" {
  provider = azurerm.sandbox
  name     = var.rg_sandbox_name
  location = var.location
}


# -------------------------------------------------------------------
# If not creating new, we assume existing subscription IDs. 
# We then move them to the correct management group.
# -------------------------------------------------------------------

resource "azurerm_management_group_subscription_association" "identity_mg" {
  count                   = var.create_identity_sub ? 0 : 1
  subscription_id         = var.subscription_identity_id
  management_group_id     = var.mg_identity_id
}

resource "azurerm_management_group_subscription_association" "connectivity_mg" {
  count                   = var.create_connectivity_sub ? 0 : 1
  subscription_id         = var.subscription_connectivity_id
  management_group_id     = var.mg_connectivity_id
}

resource "azurerm_management_group_subscription_association" "management_mg" {
  count                   = var.create_management_sub ? 0 : 1
  subscription_id         = var.subscription_management_id
  management_group_id     = var.mg_management_id
}

resource "azurerm_management_group_subscription_association" "corp_mg" {
  count                   = var.create_corp_sub ? 0 : 1
  subscription_id         = var.subscription_corp_id
  management_group_id     = var.mg_corp_id
}

resource "azurerm_management_group_subscription_association" "sandbox_mg" {
  count                   = var.create_sandbox_sub ? 0 : 1
  subscription_id         = var.subscription_sandbox_id
  management_group_id     = var.mg_sandbox_id
}

