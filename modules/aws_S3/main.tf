resource "aws_s3_bucket" "my-bucket1508" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_acl" "my-bucket1508" {
  bucket = aws_s3_bucket.my-bucket1508.id
  acl    = var.bucket_acl
}

resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.my-bucket1508.id
  versioning_configuration {
    status = "Enabled"
  }
}
