resource "azurerm_virtual_network" "hub" {
  name                = var.hub_vnet_name
  location            = var.location
  address_space       = var.hub_vnet_address_space
  resource_group_name = var.rg_connectivity_hub_name
  provider            = azurerm.connectivity
}
