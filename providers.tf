terraform {
#   cloud {
#     organization = "marinovp"

#     workspaces {
#       name = "terra-house-mvp"
#     }
#   }
  
  required_providers {
    ##https://registry.terraform.io/providers/hashicorp/random/latest/docs
    random = {
      source = "hashicorp/random"
      version = "3.5.1"
    }
    aws = {
      source = "hashicorp/aws"
      version = "5.17.0"
    }
  }
}

provider "aws" {
  # Configuration options

}

provider "random" {
  # Configuration options
}