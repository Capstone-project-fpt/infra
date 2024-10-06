resource "aws_s3_bucket" "capstone_management_bucket" {
  bucket = "capstone-management-bucket"

  tags = {
    Name        = "capstone-management-bucket"
    Environment = "Development"
  }
}

resource "aws_s3_bucket_ownership_controls" "capstone_management_bucket" {
  bucket = aws_s3_bucket.capstone_management_bucket.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "capstone_management_bucket" {
  bucket = aws_s3_bucket.capstone_management_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "capstone_management_bucket" {
  depends_on = [
    aws_s3_bucket_ownership_controls.capstone_management_bucket,
    aws_s3_bucket_public_access_block.capstone_management_bucket,
  ]

  bucket = aws_s3_bucket.capstone_management_bucket.id
  acl    = "public-read"
}
