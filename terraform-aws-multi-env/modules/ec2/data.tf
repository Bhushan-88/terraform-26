# This block defines an AWS key pair resource named "my_key_pair". It specifies the key name as "terra-auto-server-key" and retrieves the public key from a file named "terra-auto-server-key.pub". This key pair can be used for SSH access to EC2 instances created in the AWS environment.
data "aws_ami" "ubuntu_ami" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}
# VPC
data "aws_vpc" "default" {
  default = true
}