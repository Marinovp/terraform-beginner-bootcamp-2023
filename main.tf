terraform {
  required_providers {
    terratowns = {
      source = "local.providers/local/terratowns"
      version = "1.0.0"
    }
  }
  cloud {
    organization = "marinovp"

    workspaces {
      name = "terra-house-mvp"
    }
  }
  
}

provider "terratowns" {
  endpoint = var.terratowns_endpoint
  user_uuid = var.teacherseat_user_uuid
  token =  var.terratowns_access_token
}

# House #1

module "home_arcanum_hosting" {
  source = "./module/terrahome_aws"
  user_uuid = var.teacherseat_user_uuid
  public_path = var.arcanum.public_path
  content_version = var.arcanum.content_version
}

resource "terratowns_home" "home" {
  name = "How to play Arcanum in 2023!"
  description = <<DESCRIPTION
Arcanum is a game from 2001 that shipped with alot of bugs.
Modders have removed all the originals making this game really fun
to play (despite that old look graphics). This is my guide that will
show you how to play arcanum without spoiling the plot.
DESCRIPTION
  domain_name = module.home_arcanum_hosting.domain_name
  #domain_name = "*.cloudfront.net"
  town = "gamers-grotto"
  content_version = var.arcanum.content_version
}

# House #2
module "home_payday_hosting" {
  source = "./module/terrahome_aws"
  user_uuid = var.teacherseat_user_uuid
  public_path = var.payday.public_path
  content_version = var.payday.content_version
}

resource "terratowns_home" "home_payday" {
  name = "Restaurant Menu"
  description = <<DESCRIPTION
  Check the restaurant menu to order.
DESCRIPTION
  domain_name = module.home_payday_hosting.domain_name
  town = "cooker-cove"

  content_version = var.payday.content_version
}