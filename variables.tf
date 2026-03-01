variable "aws_region" {
  description = "AWS region where the instance will be launched"
  type        = string
  default     = "us-east-1"
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance (Ubuntu 22.04 LTS in us-east-1)"
  type        = string
  default     = "ami-0f3caa1cf4417e51b"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "instance_name" {
  description = "Name tag for the EC2 instance"
  type        = string
  default     = "my-web-server"
}

variable "key_pair_name" {
  description = "Name of the existing AWS Key Pair to use for SSH access"
  type        = string 
    default     = "Virginia-key"  # Replace with your actual key pair name
}
