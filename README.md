# terraform-26
terraform state list
terraform state show aws_ec2_instance_state.my_instance_state

```bash
# 1.State Locking (done)
create s3 bucket for remote backend and dynamoDB table for state locking in(remote-backend.tf)file
then create backend Block in (terraform.tf)file and mention your backend "s3" {
    bucket         = "target-corporate-1"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "target-corporate"
  }

# 2.Variables 
In Terraform, variables are used to make your configuration dynamic, reusable, and easier to maintain.
variable as a placeholder for a value.

Terraform variables are input parameters that allow us to pass dynamic values into Terraform configurations, making the infrastructure code reusable, configurable, and easier to maintain.

# 3.Output
Output = Information Terraform gives back to you
utputs.tf tells you important information about the infrastructure Terraform created.

# 4.In Terraform, import is used when a resource already exists in AWS (or another provider) but is not currently managed by Terraform, and you want Terraform to start managing it.

# 5.
```
