locals {
    env = {

        dev = {
            ec2_instance_name = "dev-terra-auto-server"
            ec2_instance_key_name = "dev-terra-auto-key"
            ec2_instance_volume_size = 8
            ec2_instance_state = "running"
            ec2_instance_type = "t3.micro"
            ec2_instance_count = 1
            bucket_count = 1
            dynamodb_table_count = 1
        }
        stg = {
            ec2_instance_name = "stg-terra-auto-server"
            ec2_instance_key_name = "stg-terra-auto-key"
            ec2_instance_volume_size = 8
            ec2_instance_state = "running"
            ec2_instance_type = "t3.micro"
            ec2_instance_count = 2
            bucket_count = 1
            dynamodb_table_count = 1
        }
        prd = {
            ec2_instance_name = "prd-terra-auto-server"
            ec2_instance_key_name = "prd-terra-auto-key"
            ec2_instance_volume_size = 8
            ec2_instance_state = "running"
            ec2_instance_type = "t3.micro"
            ec2_instance_count = 3
            bucket_name = "prd-terra-auto-bucket"
            dynamodb_table_name = "prd-terra-auto-dynamodb-table"
            dynamodb_table_count = 2
        }
    }
    current = lookup(local.env, terraform.workspace, local.env["dev"])
}

module "ec2" {
  source = "./modules/ec2"
  env = terraform.workspace #This value will be dev, stg, prd based on the workspace selected
  ec2_instance_count = local.current.ec2_instance_count
}
module "s3" {
    source = "./modules/s3"
    env = terraform.workspace #This value will be dev, stg, prd based on the workspace selected  
    s3_bucket_count = local.current.s3_bucket_count
}
module "dynamodb" {
    source = "./modules/dynamodb"
    env = terraform.workspace #This value will be dev, stg, prd based on the workspace selected  
    dynamodb_table_count = local.current.dynamodb_table_count
}