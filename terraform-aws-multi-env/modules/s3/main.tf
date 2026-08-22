resource "aws_s3_bucket" "my_bucket" {
  bucket = "${var.env}-${var.aws_s3_bucket_name}-${count.index + 1}"
  count  = var.s3_bucket_count #2

  tags = {
    name        = "${var.env}-${var.aws_s3_bucket_name}-${count.index + 1}"
    environment = var.env
  }
}

