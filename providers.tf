terraform {
  required_version = ">= 1.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

provider "azurerm" {
  alias           = "connectivity"
  features   {}
  subscription_id = var.subscription_connectivity_id
}

provider "azurerm" {
  alias           = "management"
  features         {}
  subscription_id = var.subscription_management_id
}

provider "azurerm" {
  alias           = "identity"
  features         {}
  subscription_id = var.subscription_identity_id
}

provider "azurerm" {
  alias           = "corp"
  features        {}
  subscription_id = var.subscription_corp_id
}

provider "azurerm" {
  alias           = "sandbox"
  features         {}
  subscription_id = var.subscription_sandbox_id
}


###################################### If you plan to manage Azure AD objects (users, groups, etc.), also add: ####################################################

# Optional for Azure AD resources:
# terraform {
#   required_providers {
#     azuread = {
#       source  = "hashicorp/azuread"
#       version = "~> 2.0"
#     }
#   }
# }

# provider "azuread" {
#   # Typically no special config needed if same tenant
# }
