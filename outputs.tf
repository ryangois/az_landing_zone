output "mgmt_group_platform_id" {
  description = "ID of the Platform management group"
  value       = module.management_groups.platform_id
}

output "mgmt_group_landing_zones_id" {
  description = "ID of the Landing Zones management group"
  value       = module.management_groups.landing_zones_id
}

output "connectivity_hub_vnet_id" {
  description = "ID of the Hub virtual network"
  value       = module.network.hub_vnet_id
}

output "policy_assignment_id" {
  description = "ID of the sample policy assignment"
  value       = module.policies.sample_policy_assignment_id
}
