variable "ec2_instance_name" {
  description = "Name of the EC2 instance"
  type        = string
  default     = "terra-auto-server"
}
variable "ec2_instance_key_name" {
  description = "Name of the EC2 key pair to use for SSH access"
  type        = string
  default     = "terra-auto-key"
}
variable "env" {
  description = "Deployment environment"
  type        = string
  default     = "dev"
}
variable "ec2_instance_volume_size" {
  description = "Size of the EC2 instance root volume in GB"
  type        = number
  default     = 8
}
variable "ec2_instance_state" {
  description = "Desired state of the EC2 instance"
  type        = string
  default     = "running"
}