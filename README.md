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

# 4.imports
In Terraform, import is used when a resource already exists in AWS (or another provider) but is not currently managed by Terraform, and you want Terraform to start managing it.

Interview answer :
Terraform import is used to bring an existing infrastructure resource under Terraform management by associating it with a Terraform resource and storing its information in the Terraform state. Import does not create the resource.

# 5.Ternary Operation
In Terraform, the ternary operator is used to choose one of two values based on a condition.

Interview answer :
The Terraform ternary operator is a conditional expression used to select one of two values based on a condition. Its syntax is condition ? true_value : false_value.


```
# aws multi env Modules
                EC2 Module
                    │
        ┌───────────┼───────────┐
        ↓           ↓           ↓
       Dev         Test        Prod
You write the infrastructure logic once and reuse it.

Main benefits
Reusability — write once, use multiple times
Consistency — same infrastructure pattern everywhere
Maintainability — change the module instead of many .tf files
Scalability — easily create multiple similar resources
Standardization — teams can follow the same infrastructure pattern

Instead of writing the same EC2 configuration again and again, you create it once as a module and call it whenever you need it.

## Example: Create an EC2 module
terraform-project/
│
├── main.tf
├── variables.tf
├── outputs.tf
│
└── modules/
    └── ec2/
        ├── main.tf
        ├── variables.tf
        └── outputs.tf