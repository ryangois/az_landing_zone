output "platform_id" {
  value = azurerm_management_group.platform.id
}

output "landing_zones_id" {
  value = azurerm_management_group.landing_zones.id
}

output "decommissioned_id" {
  value = azurerm_management_group.decommissioned.id
}

output "identity_id" {
  value = azurerm_management_group.identity.id
}

output "connectivity_id" {
  value = azurerm_management_group.connectivity.id
}

output "management_id" {
  value = azurerm_management_group.management.id
}

output "corp_id" {
  value = azurerm_management_group.corp.id
}

output "sandbox_id" {
  value = azurerm_management_group.sandbox.id
}
