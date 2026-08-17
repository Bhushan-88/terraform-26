locals {
  ec2_key_name = "terra-auto-server-key"
}

# This block defines an AWS key pair resource named "my_key_pair". It specifies the key name as "terra-auto-server-key" and retrieves the public key from a file named "terra-auto-server-key.pub". This key pair can be used for SSH access to EC2 instances created in the AWS environment.
resource "aws_key_pair" "my_key_pair" {
  key_name   = local.ec2_key_name
  public_key = file("${path.module}/${local.ec2_key_name}.pub")
}

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

# security group
resource "aws_security_group" "my_ec2_sg" {
  name        = "terra_auto_sg"
  description = "Security group for EC2 instance"
  vpc_id      = data.aws_vpc.default.id
}
#ingess rule (inbound rule) for SSH access
resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  security_group_id = aws_security_group.my_ec2_sg.id
  description      = "Allow SSH access"
  from_port       = 22
  ip_protocol     = "tcp"
  to_port         = 22
  cidr_ipv4        = "0.0.0.0/0"
}
resource "aws_vpc_security_group_ingress_rule" "allow_http" {
  security_group_id = aws_security_group.my_ec2_sg.id
  description     = "Allow HTTP access"
  cidr_ipv4        = "0.0.0.0/0"
  from_port       = 80
  ip_protocol     = "tcp"
  to_port         = 80
}
# Egress rule (outbound rule) for all traffic
resource "aws_vpc_security_group_egress_rule" "allow_all_outbound" {
  security_group_id = aws_security_group.my_ec2_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}
resource "aws_instance" "my_ec2_instance" {
    ami           = data.aws_ami.ubuntu_ami.id
    instance_type = "t3.micro"
    vpc_security_group_ids = [aws_security_group.my_ec2_sg.id]
    key_name      = aws_key_pair.my_key_pair.key_name
    
    root_block_device {
        volume_size = var.ec2_instance_volume_size
        volume_type = "gp3"
    }
    tags = {
        Name = var.ec2_instance_name
    }
}


resource "aws_ec2_instance_state" "my_instance_state" {
    instance_id = aws_instance.my_ec2_instance.id
    state = var.ec2_instance_state
}

