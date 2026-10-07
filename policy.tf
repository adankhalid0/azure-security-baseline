# Built-in Azure Policy definitions, assigned in Audit mode (no deny), so the
# baseline reports non-compliance without breaking existing resources.
locals {
  audit_policies = {
    storage_secure_transfer = "Secure transfer to storage accounts should be enabled"
    storage_public_access   = "Storage account public access should be disallowed"
    network_watcher         = "Network Watcher should be enabled"
  }
}

data "azurerm_policy_definition" "builtin" {
  for_each     = local.audit_policies
  display_name = each.value
}

resource "azurerm_subscription_policy_assignment" "audit" {
  for_each             = data.azurerm_policy_definition.builtin
  name                 = replace(each.key, "_", "-")
  display_name         = each.value.display_name
  subscription_id      = data.azurerm_subscription.current.id
  policy_definition_id = each.value.id
}
