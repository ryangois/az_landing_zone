variable "create_identity_sub" {
  description = "Create a new subscription for Identity?"
  type        = bool
  default     = false
}

variable "create_connectivity_sub" {
  description = "Create a new subscription for Connectivity?"
  type        = bool
  default     = false
}

variable "create_management_sub" {
  description = "Create a new subscription for Management?"
  type        = bool
  default     = false
}

variable "create_corp_sub" {
  description = "Create a new subscription for Corp?"
  type        = bool
  default     = false
}

variable "create_sandbox_sub" {
  description = "Create a new subscription for Sandbox?"
  type        = bool
  default     = false
}

variable "subscription_identity_id" {
  description = "Existing Identity subscription ID (if not creating new)."
  type        = string
}

variable "subscription_connectivity_id" {
  description = "Existing Connectivity subscription ID (if not creating new)."
  type        = string
}

variable "subscription_management_id" {
  description = "Existing Management subscription ID (if not creating new)."
  type        = string
}

variable "subscription_corp_id" {
  description = "Existing Corp subscription ID (if not creating new)."
  type        = string
}

variable "subscription_sandbox_id" {
  description = "Existing Sandbox subscription ID (if not creating new)."
  type        = string
}

variable "mg_platform_id" {
  type        = string
  description = "Platform management group ID"
}

variable "mg_identity_id" {
  type        = string
  description = "Identity management group ID"
}

variable "mg_connectivity_id" {
  type        = string
  description = "Connectivity management group ID"
}

variable "mg_management_id" {
  type        = string
  description = "Management management group ID"
}

variable "mg_landing_zones_id" {
  type        = string
  description = "Landing Zones management group ID"
}

variable "mg_corp_id" {
  type        = string
  description = "Corp management group ID"
}

variable "mg_sandbox_id" {
  type        = string
  description = "Sandbox management group ID"
}

# The billing scope ID is required if you are creating new subscriptions.
# For an EA account, this typically looks like: /providers/Microsoft.Billing/billingAccounts/123456
variable "billing_scope_id" {
  description = "Billing scope ID if creating new subscriptions"
  type        = string
  default     = ""
}
