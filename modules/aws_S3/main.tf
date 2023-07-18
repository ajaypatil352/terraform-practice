resource "aws_s3_bucket" "my-bucket1808" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_acl" "my-bucket1808" {
  bucket = aws_s3_bucket.my-bucket1808.id
  acl    = var.bucket_acl
}

resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.my-bucket1808.id
  versioning_configuration {
    status = var.versioning_status
  }
}
