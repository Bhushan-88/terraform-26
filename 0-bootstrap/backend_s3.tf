# This file contains the Terraform configuration for creating an S3 bucket to be used as a backend for storing Terraform state files.
resource "aws_s3_bucket" "terraform_backend" {
  bucket        = var.backend_bucket_name
  force_destroy = true

  tags = {
    Name    = "terraform-backend"
    Purpose = "Terraform state"
  }
}
# This resource block creates an S3 bucket with the name specified in the `backend_bucket_name` variable. The `force_destroy` attribute is set to true, which allows the bucket to be deleted even if it contains objects. The bucket is also tagged with a name and purpose for easier identification.
resource "aws_s3_bucket_versioning" "terraform_backend" {
  bucket = aws_s3_bucket.terraform_backend.id

  versioning_configuration {
    status = "Enabled"
  }
}
# This resource block enables versioning for the S3 bucket created above. Versioning allows you to keep multiple versions of an object in the same bucket, which can be useful for recovering from accidental deletions or overwrites.
resource "aws_s3_bucket_server_side_encryption_configuration" "terraform_backend" {
  bucket = aws_s3_bucket.terraform_backend.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}
# This resource block enables server-side encryption for the S3 bucket using the AES256 algorithm. This ensures that all objects stored in the bucket are encrypted at rest, providing an additional layer of security for your Terraform state files.
resource "aws_s3_bucket_public_access_block" "terraform_backend" {
  bucket = aws_s3_bucket.terraform_backend.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
