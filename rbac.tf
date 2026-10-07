# Least-privilege read access for security reviewers.
resource "azurerm_role_assignment" "security_reader" {
  for_each             = toset(var.security_reader_principal_ids)
  scope                = data.azurerm_subscription.current.id
  role_definition_name = "Security Reader"
  principal_id         = each.value
}
