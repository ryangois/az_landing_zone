# -----------------------------------------------------------------------------
# Module: Management Groups
# -----------------------------------------------------------------------------
module "management_groups" {
  source = "./modules/management_groups"
  
  tenant_root_id = var.tenant_root_id
}

# -----------------------------------------------------------------------------
# Module: Subscriptions
# If referencing existing subscriptions (Approach A), keep create_*_sub = false.
# If creating new subscriptions (Approach B), set create_*_sub = true and
# ensure you have the correct billing_scope_id and permissions.
# -----------------------------------------------------------------------------
module "subscriptions" {
  source = "./modules/subscriptions"

  # Approach B: Provide display names for new subscriptions
  # (Requires an Enrollment Account or relevant permissions)
  create_identity_sub       = false
  create_connectivity_sub   = false
  create_management_sub     = false
  create_corp_sub           = false
  create_sandbox_sub        = false

  # If not creating new, move existing subscriptions:
  subscription_identity_id     = var.subscription_identity_id
  subscription_connectivity_id = var.subscription_connectivity_id
  subscription_management_id   = var.subscription_management_id
  subscription_corp_id         = var.subscription_corp_id
  subscription_sandbox_id      = var.subscription_sandbox_id

  mg_platform_id       = module.management_groups.platform_id
  mg_identity_id       = module.management_groups.identity_id
  mg_connectivity_id   = module.management_groups.connectivity_id
  mg_management_id     = module.management_groups.management_id
  mg_landing_zones_id  = module.management_groups.landing_zones_id
  mg_corp_id           = module.management_groups.corp_id
  mg_sandbox_id        = module.management_groups.sandbox_id
}

# -----------------------------------------------------------------------------
# Module: Resource Groups
# Creates resource groups in each subscription as needed.
# -----------------------------------------------------------------------------
module "resource_groups" {
  source = "./modules/resource_groups"

  subscription_identity_id     = var.subscription_identity_id
  subscription_connectivity_id = var.subscription_connectivity_id
  subscription_management_id   = var.subscription_management_id
  subscription_corp_id         = var.subscription_corp_id
  subscription_sandbox_id      = var.subscription_sandbox_id

  rg_connectivity_hub_name   = var.rg_connectivity_hub_name
  rg_management_monitor_name = var.rg_management_monitor_name
  rg_identity_name           = var.rg_identity_name
  rg_corp_production_name    = var.rg_corp_production_name
  rg_sandbox_name            = var.rg_sandbox_name

  location = var.location
}

# -----------------------------------------------------------------------------
# Module: Network
# Creates a hub virtual network in the Connectivity subscription’s hub RG.
# -----------------------------------------------------------------------------
module "network" {
  source = "./modules/network"

  subscription_connectivity_id = var.subscription_connectivity_id
  rg_connectivity_hub_name     = var.rg_connectivity_hub_name
  hub_vnet_name                = var.hub_vnet_name
  hub_vnet_address_space       = var.hub_vnet_address_space
  location                     = var.location
}

# -----------------------------------------------------------------------------
# Module: Policies
# Assigns a sample or custom policy at the given scope.
# -----------------------------------------------------------------------------
module "policies" {
  source = "./modules/policies"

  scope                = var.policy_assignment_scope
  policy_definition_id = var.policy_definition_id
  parameters           = var.policy_parameters
}