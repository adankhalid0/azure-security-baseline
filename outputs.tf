output "log_analytics_workspace_id" {
  value = azurerm_log_analytics_workspace.main.id
}

output "storage_account_name" {
  value = azurerm_storage_account.secure.name
}

output "policy_assignments" {
  value = [for a in azurerm_subscription_policy_assignment.audit : a.display_name]
}
