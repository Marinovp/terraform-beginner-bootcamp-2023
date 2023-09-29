# Terraform Beginner Bootcamp 2023 - Week 0 

## Root Module Structure
Root module structure should be as follow:

                Terraform Project Structure
      PROJECT ROOT
      ├── main.tf            # everything else
      ├── outputs.tf         # stores our outputs
      ├── providers.tf       # defines required providers andtheir configuration
      ├── terraform.tfvars   # the data of variables we want to load into our Terraform project
      ├── variables.tf       # stores the structure of input variables
      └── README.md          # Required for Root modules

[Standard Module Structure](https://developer.hashicorp.com/terraform/language/modules/develop/structure)

The above was generated using Google Bard, but the Standard Module Structure from Terraform also have examples.
