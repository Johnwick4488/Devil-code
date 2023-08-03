module "s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket = "santosh-bucket-000044"
  acl    = "private"

  control_object_ownership = true
  object_ownership         = "ObjectWriter"

  versioning = {
    enabled = true
  }
}