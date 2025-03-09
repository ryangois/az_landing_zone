variable "subscription_identity_id" {
  type        = string
  description = "Identity subscription ID"
}

variable "subscription_connectivity_id" {
  type        = string
  description = "Connectivity subscription ID"
}

variable "subscription_management_id" {
  type        = string
  description = "Management subscription ID"
}

variable "subscription_corp_id" {
  type        = string
  description = "Corp subscription ID"
}

variable "subscription_sandbox_id" {
  type        = string
  description = "Sandbox subscription ID"
}

variable "rg_connectivity_hub_name" {
  type        = string
  description = "Name of the connectivity hub resource group"
}

variable "rg_management_monitor_name" {
  type        = string
  description = "Name of the management monitor resource group"
}

variable "rg_identity_name" {
  type        = string
  description = "Name of the identity resource group"
}

variable "rg_corp_production_name" {
  type        = string
  description = "Name of the corp production resource group"
}

variable "rg_sandbox_name" {
  type        = string
  description = "Name of the sandbox resource group"
}

variable "location" {
  type        = string
  description = "Azure region"
}
