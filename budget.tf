# Cost guardrail, important on a free/trial subscription.
resource "azurerm_consumption_budget_subscription" "monthly" {
  count           = length(var.alert_emails) > 0 ? 1 : 0
  name            = "${var.prefix}-monthly-budget"
  subscription_id = data.azurerm_subscription.current.id

  amount     = var.monthly_budget
  time_grain = "Monthly"

  time_period {
    start_date = var.budget_start_date
  }

  notification {
    enabled        = true
    threshold      = 80
    operator       = "GreaterThan"
    threshold_type = "Actual"
    contact_emails = var.alert_emails
  }
}
