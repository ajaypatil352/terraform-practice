resource "aws_s3_bucket" "my-bucket1507" {
  bucket = "my-bucket1507"
}

resource "aws_s3_bucket_acl" "my-bucket1507" {
  bucket = aws_s3_bucket.my-bucket1507.id
  acl    = "public"
}

resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.my-bucket1507.id
  versioning_configuration {
    status = "Enabled"
  }
}
