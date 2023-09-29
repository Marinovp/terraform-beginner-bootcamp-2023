terraform {
#   cloud {
#     organization = "marinovp"

#     workspaces {
#       name = "terra-house-mvp"
#     }
#   }
  
}

module "terrahouse_aws" {
  source = "./module/terrahouse_aws"
  user_uuid = var.user_uuid
  bucket_name = var.bucket_name
}