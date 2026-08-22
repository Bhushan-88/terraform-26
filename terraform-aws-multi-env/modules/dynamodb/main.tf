resource "aws_dynamodb_table" "target-corporate-table" {
  name         = "${var.env}-${var.dynamodb_table_name}-${count.index + 1}"
  count        = var.dynamodb_table_count
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name        = var.dynamodb_table_name
    Environment = var.env
  }

}