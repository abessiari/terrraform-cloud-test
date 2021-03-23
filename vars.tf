variable "account_name" {
  type = string
  default = "test_billing_from_terraform_cloud"
}

variable "emails" {
  description = "List of emails"
  type = list(string)
}

variable "account_budget_limit" {
  type = string
}

variable "services" {
  description = "List of AWS services to be monitored in terms of costs"

  type = map(object({
    budget_limit = string
  }))

  default = {
    EC2 = {
      budget_limit = "500.0"
    },
    S3 = {
      budget_limit = "100.0"
    }
  }
}
