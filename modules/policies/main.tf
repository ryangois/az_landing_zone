resource "azurerm_policy_assignment" "sample" {
  name                 = "SamplePolicyAssignment"
  scope                = var.scope
  policy_definition_id = var.policy_definition_id
  description          = "Sample policy assignment to illustrate governance"
  parameters           = var.parameters
}
