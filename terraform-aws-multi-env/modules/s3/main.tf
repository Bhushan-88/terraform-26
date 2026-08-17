resource "aws_s3_bucket" "my_bucket" {
  bucket = "test-my-app-bucket-100"

  tags = {
  name = var.aws_s3_bucket_name
  }
}

