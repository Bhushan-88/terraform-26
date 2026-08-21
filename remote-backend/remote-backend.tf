#s3 bucket to handle the terraform state file for remote backend
resource "aws_s3_bucket" "remote-s3-bucket" {
    bucket = "target-corporate-1"

    tags = {
        Name = "target-corporate-1"
  
    }
}
# dynamodb table to handle the terraform state file for remote backend
resource "aws_dynamodb_table" "test-dynamodb" {
    name = "target-corporate"
    billing_mode = "PAY_PER_REQUEST"
    hash_key = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}