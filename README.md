# Terraform Beginner Bootcamp 2023

![architectural-diagram](https://github.com/omenking/terraform-beginner-bootcamp-2023/assets/7776/ab015431-2d14-4910-aa37-be4807b2b905)


## Weekly Journals
- [Week 0 Journal](Journal/Week0.md)

## Extras
- [Github Markdown TOC Generator](https://ecotrust-canada.github.io/markdown-toc/)
- [GitHub Markdown TOC Generator 2](https://dillinger.io/)


## Terraform variabkes and Input variables
## Terraform Cloud Variables

In Terraform we can set two kind of vars:
- Environment variables : those are set in your bash terminal
- Terraform variables : those are set normally in the tfvars file

We can set Terraform Cloud vars to be sensitive so they are not showin in the UI

## Loading Terraform  Input Variables
[Terraform input variables](https://developer.hashicorp.com/terraform/language/values/variables#custom-validation-rules)

### var flag
We can set the '-var' flag to set an input varibale or override a variable in the tfvars file eg.'terraform -var user_uuid="user id"'

### var-file flag

- TODO: Research/Document this flag

### terraform,tfvars

This is the defauklt file to load in terraform variables in bulk

### auto.tfvars

- TODO: document this fucntionality for terraform cloud

### order of terraform variables

- TODO: document which terraform settings take precedence.


### Notes to self
Format for tf file is important, for example:
```
variable "user_uuid" {
  description = "The UUID of the user"
  type        = string
  validation {
    condition        = can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[1-5][0-9a-fA-F]{3}-[89abAB][0-9a-fA-F]{3}-[0-9a-fA-F]{12}$", var.user_uuid))
    error_message    = "The user_uuid value is not a valid UUID."
  }
}```

Is not the same as :
```
variable "user_uuid" {
  description = "The UUID of the user"
  type        = string
  validation {
                condition        = can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[1-5][0-9a-fA-F]{3}-[89abAB][0-9a-fA-F]{3}-[0-9a-fA-F]{12}$", var.user_uuid))
                error_message    = "The user_uuid value is not a valid UUID."
            }
}
```

Follow the same format as TF documentation as the 2nd example above will fail, DO NOT try to format the code to your likening.