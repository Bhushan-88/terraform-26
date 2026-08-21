output "ec2_public_ip" {
  value = aws_instance.my_ec2_instance[*].public_ip
}
output "ec2_public_dns" {
  value = aws_instance.my_ec2_instance[*].public_dns
}

output "instance_id" {
  value = aws_instance.my_ec2_instance[*].id
}

output "public_ip" {
  value = aws_instance.my_ec2_instance[*].public_ip
}

output "private_ip" {
  value = aws_instance.my_ec2_instance[*].private_ip
}