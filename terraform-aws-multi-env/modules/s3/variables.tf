variable "aws_s3_bucket_name" {
  description = "this variable holds s3 bucket name"
  default = "test-my-app-bucket-100"
  type = string
}

variable "env" {
  description = "Deployment environment"
  type        = string
  
}