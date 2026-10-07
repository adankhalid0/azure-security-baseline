variable "subscription_id" {
  description = "Azure subscription ID the baseline is deployed to."
  type        = string
}

variable "location" {
  description = "Azure region for all resources."
  type        = string
  default     = "norwayeast"
}

variable "prefix" {
  description = "Short prefix used in resource names."
  type        = string
  default     = "secbase"
}

variable "log_retention_days" {
  description = "Retention (days) for the Log Analytics workspace."
  type        = number
  default     = 30
}

variable "log_daily_quota_gb" {
  description = "Daily ingestion cap in GB. Keeps cost predictable on a free account. Use -1 for no cap."
  type        = number
  default     = 1
}

variable "enable_defender_plans" {
  description = "Enable paid Microsoft Defender for Cloud plans. Leave false on a free account to avoid cost."
  type        = bool
  default     = false
}

variable "security_reader_principal_ids" {
  description = "Object IDs (users/groups) granted the built-in Security Reader role at subscription scope."
  type        = list(string)
  default     = []
}

variable "alert_emails" {
  description = "E-mail addresses for budget alerts. Leave empty to skip creating the budget."
  type        = list(string)
  default     = []
}

variable "monthly_budget" {
  description = "Monthly budget in the subscription's currency."
  type        = number
  default     = 10
}

variable "budget_start_date" {
  description = "First day of a month, RFC3339 (e.g. 2026-10-01T00:00:00Z). Required by the budget resource."
  type        = string
  default     = "2026-10-01T00:00:00Z"
}

variable "tags" {
  description = "Tags applied to all resources."
  type        = map(string)
  default = {
    project = "azure-security-baseline"
    managed = "terraform"
  }
}
