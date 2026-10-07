# Microsoft Defender for Cloud plans. Standard tiers are billed, so they are
# off by default (Free tier) and enabled with var.enable_defender_plans.
locals {
  defender_plans = ["StorageAccounts", "KeyVaults", "Arm"]
}

resource "azurerm_security_center_subscription_pricing" "plans" {
  for_each      = toset(local.defender_plans)
  tier          = var.enable_defender_plans ? "Standard" : "Free"
  resource_type = each.value
}
