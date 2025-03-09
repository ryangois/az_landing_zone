variable "subscription_connectivity_id" {
  description = "Connectivity subscription ID"
  type        = string
}

variable "rg_connectivity_hub_name" {
  description = "Name of the connectivity hub resource group"
  type        = string
}

variable "hub_vnet_name" {
  description = "Name of the hub virtual network"
  type        = string
}

variable "hub_vnet_address_space" {
  description = "Address space for the hub virtual network"
  type        = list(string)
}

variable "location" {
  description = "Azure region"
  type        = string
}
