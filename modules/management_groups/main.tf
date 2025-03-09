data "azurerm_management_group" "root" {
  name = var.tenant_root_id
}

# Platform MG
resource "azurerm_management_group" "platform" {
  name                       = "Platform"
  display_name               = "Platform"
  parent_management_group_id = data.azurerm_management_group.root.id
}

# Landing Zones MG
resource "azurerm_management_group" "landing_zones" {
  name                       = "Landing Zones"
  display_name               = "Landing Zones"
  parent_management_group_id = data.azurerm_management_group.root.id
}

# Decommissioned MG (optional if you want it)
resource "azurerm_management_group" "decommissioned" {
  name                       = "Decommissioned"
  display_name               = "Decommissioned"
  parent_management_group_id = data.azurerm_management_group.root.id
}

# Under Platform
resource "azurerm_management_group" "identity" {
  name                       = "Identity"
  display_name               = "Identity"
  parent_management_group_id = azurerm_management_group.platform.id
}

resource "azurerm_management_group" "connectivity" {
  name                       = "Connectivity"
  display_name               = "Connectivity"
  parent_management_group_id = azurerm_management_group.platform.id
}

resource "azurerm_management_group" "management" {
  name                       = "Management"
  display_name               = "Management"
  parent_management_group_id = azurerm_management_group.platform.id
}

# Under Landing Zones
resource "azurerm_management_group" "corp" {
  name                       = "Corp"
  display_name               = "Corp"
  parent_management_group_id = azurerm_management_group.landing_zones.id
}

resource "azurerm_management_group" "sandbox" {
  name                       = "Sandbox"
  display_name               = "Sandbox"
  parent_management_group_id = azurerm_management_group.landing_zones.id
}
