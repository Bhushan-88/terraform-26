# This file contains the provider configuration for Terraform, specifying the required Terraform version and the AWS provider version. It also sets the AWS region to be used for creating resources.
terraform {
  required_version = ">= 1.15.8"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  backend "s3" {
    bucket         = "target-corporate-backend-12345"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    use_lockfile = true
  }
}
# This block specifies the required Terraform version and the AWS provider version. 
# It ensures that the configuration is compatible with Terraform version 1.15.8 or higher and uses the AWS provider version 6.x.
provider "aws" {
  region = "us-east-1"
}
