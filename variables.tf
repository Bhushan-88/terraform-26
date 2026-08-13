# This file contains the variable definitions for the Terraform configuration, including the AWS region and the name of the S3 bucket to be used as a backend for storing Terraform state files.
variable "aws_region" {
  description = "AWS region for the S3 backend bucket"
  type        = string
  default     = "us-east-1"
}
# This variable defines the AWS region where the S3 bucket for the Terraform backend will be created. The default value is set to "us-east-1", but you can change it to any valid AWS region as needed.
variable "backend_bucket_name" {
  description = "Globally unique name for the Terraform backend S3 bucket"
  type        = string
  default     = "target-corporate-terraform-backend"
}
