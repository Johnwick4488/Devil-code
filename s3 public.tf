resource "aws_s3_bucket" "santosh-bucket-00004455" {
  bucket = "santosh-bucket-00004455"
}

resource "aws_s3_bucket_public_access_block" "santosh-bucket-00004455" {
  bucket = aws_s3_bucket.santosh-bucket-00004455.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}