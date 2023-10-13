output "bucket_name" {
  description = "Bucket nanme for static website"
  value = module.home_arcanum_hosting.bucket_name
}

output "s3_website_endpoint" {
  description = "Output of S3 Static Website"
  value = module.home_arcanum_hosting.website_endpoint
}

output "cloudfront_url" {
  description = "The Cloudfront Distribution Domain Name"
  value = module.home_arcanum_hosting.domain_name
}