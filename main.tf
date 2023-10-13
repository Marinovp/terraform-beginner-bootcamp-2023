terraform {
  required_providers {
    terratowns = {
      source = "local.providers/local/terratowns"
      version = "1.0.0"
    }
  }
#   cloud {
#     organization = "marinovp"

#     workspaces {
#       name = "terra-house-mvp"
#     }
#   }
  
}

provider "terratowns" {
  endpoint = var.terratowns_endpoint
  user_uuid = var.teacherseat_user_uuid
  token =  var.terratowns_access_token
}

module "terrahouse_aws" {
  source = "./module/terrahouse_aws"
  user_uuid = var.teacherseat_user_uuid
  bucket_name = var.bucket_name
  index_html_filepath = var.index_html_filepath
  error_html_filepath = var.error_html_filepath
  assets_path = var.assets_path
  content_version = var.content_version
}

resource "terratowns_home" "home" {
  name = "How to play Arcanum in 2023!"
  description = <<DESCRIPTION
Arcanum is a game from 2001 that shipped with alot of bugs.
Modders have removed all the originals making this game really fun
to play (despite that old look graphics). This is my guide that will
show you how to play arcanum without spoiling the plot.
DESCRIPTION
  domain_name = module.terrahouse_aws.cloudfront_url
  #domain_name = "*.cloudfront.net"
  town = "missingo"
  content_version = 1
}
