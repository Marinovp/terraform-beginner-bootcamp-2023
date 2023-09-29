variable "user_uuid" {
  description = "The UUID of the user"
  type        = string
  validation {
    condition        = can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[1-5][0-9a-fA-F]{3}-[89abAB][0-9a-fA-F]{3}-[0-9a-fA-F]{12}$", var.user_uuid))
    error_message    = "The user_uuid value is not a valid UUID."
  }
}

variable "bucket_name" {
  type = string
  description = "The name of the S3 bucket."
  validation {
    condition = can(regex("^[a-z0-9-]{1,63}$", var.bucket_name))
    error_message = "The bucket_name must be a valid S3 bucket name. For more information, see https://docs.aws.amazon.com/AmazonS3/latest/dev/BucketRestrictions.html."
  }
}