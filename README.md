# Provision AWS instance.

## Requirements 

- The steps below were successfully tested using:
    - Terraform (0.14.4)

#### Install Terraform

- Go to [url](https://learn.hashicorp.com/tutorials/terraform/install-cli)

#### AWS Credentials.
- Create a file or override the location in provider.tf

```
[default]
aws_access_key_id = XXXX
aws_secret_access_key = XXXX
```

#### EMAILS 
- Overide the emails used in vars.tf

```
variable "emails" {
  description = "List of emails"
  type = list(string)
  default = ["xxx@gmail.com"]
}
```


#### Services and Budget Limts : 

These are specified in vars.tf. You can also add others services specified in service.tf.

```sh
variable "account_budget_limit" {
  type = string
  default = "20.0"
}

variable "services" {
  default = {
    EC2 = {
      budget_limit = "10.0"
    },
    S3 = {
      budget_limit = "5.0"
    }
  }
}
```

#### Create Budgets: 

Note: Terraform creates some folders and files to maintain the state. Use <i>ls -a aws</i>

```sh
# This will install the aws terraform provider. 
terraform init

# Validate the config
terraform validate

# View what is going to be created. The plan.
terraform plan

# This will create the budgets
terraform apply

#To view:
terraform show 

#To destroy:
terraform destroy 

```
