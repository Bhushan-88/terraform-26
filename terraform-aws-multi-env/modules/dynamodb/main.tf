resource "aws_dynamodb_table" "target-corporate-table" {
  name           = var.dynamodb_table_name
  count          = "${var.dynamodb_table_count}-${count.index + 1}"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
  
}