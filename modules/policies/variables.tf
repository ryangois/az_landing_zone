variable "scope" {
  description = "Scope for policy assignment (MG or subscription ID)"
  type        = string
}

variable "policy_definition_id" {
  description = "Policy definition ID"
  type        = string
}

variable "parameters" {
  description = "Parameters for the policy assignment"
  type        = map(any)
  default     = {}
}
