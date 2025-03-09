#######################################################
# Core variables
#######################################################

variable "tenant_root_id" {
  description = "The ID of the tenant root management group (read-only, typically '00000000-0000-0000-0000-000000000000' or the actual tenant ID)."
  type        = string
}

variable "location" {
  description = "Default Azure region for resources"
  default     = "East US"
}

#######################################################
# Subscription variables (Approach A: referencing existing)
#######################################################

variable "subscription_identity_id" {
  description = "Existing subscription ID for Identity (optional if you do not create a new subscription)."
  type        = string
  default     = "00000000-0000-0000-0000-000000000000"
}

variable "subscription_connectivity_id" {
  description = "Existing subscription ID for Connectivity."
  type        = string
  default     = "00000000-0000-0000-0000-000000000000"
}

variable "subscription_management_id" {
  description = "Existing subscription ID for Management."
  type        = string
  default     = "00000000-0000-0000-0000-000000000000"
}

variable "subscription_corp_id" {
  description = "Existing subscription ID for Corp Landing Zone."
  type        = string
  default     = "00000000-0000-0000-0000-000000000000"
}

variable "subscription_sandbox_id" {
  description = "Existing subscription ID for Sandbox Landing Zone."
  type        = string
  default     = "00000000-0000-0000-0000-000000000000"
}

#######################################################
# Resource Group names
#######################################################

variable "rg_connectivity_hub_name" {
  description = "Name of the Connectivity Hub Resource Group"
  default     = "rg-connectivity-hub"
}

variable "rg_management_monitor_name" {
  description = "Name of the Management Monitor Resource Group"
  default     = "rg-management-monitor"
}

variable "rg_identity_name" {
  description = "Name of the Identity Resource Group"
  default     = "rg-identity"
}

variable "rg_corp_production_name" {
  description = "Name of the Corp Production Resource Group"
  default     = "rg-corp-production"
}

variable "rg_sandbox_name" {
  description = "Name of the Sandbox Resource Group"
  default     = "rg-sandbox"
}

#######################################################
# Network / Hub variables
#######################################################

variable "hub_vnet_name" {
  description = "Name of the hub virtual network"
  default     = "vnet-hub"
}

variable "hub_vnet_address_space" {
  description = "Address space for the hub virtual network"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

#######################################################
# Policy variables
#######################################################

variable "policy_assignment_scope" {
  description = "Scope for the sample policy assignment. Can be a management group or subscription ID."
  default     = "00000000-0000-0000-0000-000000000000"
}

variable "policy_definition_id" {
  description = "Policy definition ID to assign (built-in or custom)."
  default     = "/providers/Microsoft.Authorization/policyDefinitions/aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa"
}

variable "policy_parameters" {
  description = "Parameters for the sample policy assignment"
  type        = map(any)
  default     = {}
}
