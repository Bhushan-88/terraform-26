variable "ec2_instance_name" {
  description = "Name of the EC2 instance"
  type        = string
  default     = "terra-auto-server"
}
variable "ec2_instance_volume_size" {
  description = "Size of the EC2 instance root volume in GB"
  type        = number
  default     = 8
}
variable "ec2_instance_state" {
  description = "Desired state of the EC2 instance"
  type        = string
  default     = "stopped"
}