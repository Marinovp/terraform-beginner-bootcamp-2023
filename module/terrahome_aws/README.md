## Terrahouse AWS



```tf
module "home_payday" {
  source = "./module/terrahome_aws"
  user_uuid = var.teacherseat_user_uuid
  public_path = var.payday_public_path
  bucket_name = var.bucket_name
  # index_html_filepath = var.index_html_filepath
  # error_html_filepath = var.error_html_filepath
  # assets_path = var.assets_path
  content_version = var.content_version
}
```
The public directory expect the following:
- index.html
- error.html
- assets

All top level files in assets will be copied, but not any subdirectories