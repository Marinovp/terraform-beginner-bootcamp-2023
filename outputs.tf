output "bucket_name" {
  description = "Bucket nanme for static website"
  value = module.terrahouse_aws.bucket_name
}

output "s3_website_endpoint" {
  description = "Output of S3 Static Website"
  value = module.terrahouse_aws.website_endpoint
}