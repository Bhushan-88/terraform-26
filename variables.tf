variable "aws_region" {
  description = "AWS region for the S3 backend bucket"
  type        = string
  default     = "us-east-1"
}

variable "backend_bucket_name" {
  description = "Globally unique name for the Terraform backend S3 bucket"
  type        = string
  default     = "my-terraform-backend-bucket-123456"
}
