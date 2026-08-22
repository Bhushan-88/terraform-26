locals {

    dev = {
        ec2_instance_name = "dev-terra-auto-server"
        ec2_instance_key_name = "dev-terra-auto-key"
        ec2_instance_volume_size = 8
        ec2_instance_state = "running"
        ec2_instance_type = "t3.micro"
        ec2_instance_count = 2
    }
    stg = {
        ec2_instance_name = "stg-terra-auto-server"
        ec2_instance_key_name = "stg-terra-auto-key"
        ec2_instance_volume_size = 8
        ec2_instance_state = "running"
        ec2_instance_type = "t3.micro"
        ec2_instance_count = 1
    }
    prd = {
        ec2_instance_name = "prd-terra-auto-server"
        ec2_instance_key_name = "prd-terra-auto-key"
        ec2_instance_volume_size = 8
        ec2_instance_state = "running"
        ec2_instance_type = "t3.micro"
        ec2_instance_count = 1
    }
}

module "ec2" {
  source = "./modules/ec2"
  env = terraform.workspace #dev this value will be used to select the environment
  ec2_instance_count = local.dev.ec2_instance_count
}