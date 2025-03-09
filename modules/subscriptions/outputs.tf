# Output the newly created subscription IDs if we created them
output "subscription_identity_out" {
  description = "Newly created Identity subscription ID (if created)"
  value       = azurerm_subscription.identity[*].subscription_id
}

output "subscription_connectivity_out" {
  description = "Newly created Connectivity subscription ID (if created)"
  value       = azurerm_subscription.connectivity[*].subscription_id
}

output "subscription_management_out" {
  description = "Newly created Management subscription ID (if created)"
  value       = azurerm_subscription.management[*].subscription_id
}

output "subscription_corp_out" {
  description = "Newly created Corp subscription ID (if created)"
  value       = azurerm_subscription.corp[*].subscription_id
}

output "subscription_sandbox_out" {
  description = "Newly created Sandbox subscription ID (if created)"
  value       = azurerm_subscription.sandbox[*].subscription_id
}
