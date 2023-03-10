# Configure the AWS provider
provider "aws" {
  region = "us-east-1"
}

# Create a S3 bucket
resource "aws_s3_bucket" "demo" {
  bucket		  = "${var.bucket_name}"
  lifecycle {
    prevent_destroy = true
  }  
}

resource "aws_s3_bucket_acl" "demo_bucket_acl" {
  bucket = aws_s3_bucket.demo.id
  acl    = "public-read"
}


resource "aws_s3_bucket_public_access_block" "default" {
  bucket = aws_s3_bucket.demo.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}