variable aws_credentials_file {
  type = string
  default = "~/.aws/credentials"
}

variable "region" {
  type = string
  default = "us-west-2"
}

variable "account_name" {
  type = string
  default = "test_noctua_billing"
}

variable "emails" {
  description = "List of emails"
  type = list(string)
  default = ["xxxx@gmail.com"]
}

variable "account_budget_limit" {
  type = string
  default = "20.0"
}

variable "services" {
  description = "List of AWS services to be monitored in terms of costs"

  type = map(object({
    budget_limit = string
  }))

  default = {
    EC2 = {
      budget_limit = "10.0"
    },
    S3 = {
      budget_limit = "5.0"
    }
  }
}
