terraform {
    required_providers {
    ##https://registry.terraform.io/providers/hashicorp/random/latest/docs
    # random = {
    #   source = "hashicorp/random"
    #   version = "3.5.1"
    # }
    aws = {
      source = "hashicorp/aws"
      version = "5.17.0"
    }
  }

}

resource "aws_s3_bucket" "website_bucket" {
  bucket = var.bucket_name

  tags = {
    UserUuid = var.user_uuid
  }

}

