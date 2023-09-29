# Terraform Beginner Bootcamp 2023 - Week 0 

## Root Module Structure
Root module structure should be as follow:

                Terraform Project Structure
      PROJECT ROOT
      ├── main.tf            # everything else
      ├── variables.tf       # stores the structure of input variables
      ├── providers.tf       # defines required providers and their configuration
      ├── outputs.tf         # stores our outputs
      ├── terraform.tfvars   # the data of variables we want to load into our Terraform project
      └── README.md          # Required for Root modules

[Standard Module Structure](https://developer.hashicorp.com/terraform/language/modules/develop/structure)

The above was generated using Google Bard, but the Standard Module Structure from Terraform also have examples.
