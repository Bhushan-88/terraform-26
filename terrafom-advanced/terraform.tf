terraform {
  required_version = ">= 1.15.8"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.38.0"
    }
  }
  backend "s3" {
    bucket         = "target-corporate-1"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "target-corporate"
  }
}
