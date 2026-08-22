variable "dynamodb_table_name" {
  description = "The name of the DynamoDB table"
  type        = string
  default     = "target-corporate-table"
}
variable "env" {
  description = "The environment for which the DynamoDB table is being created (dev, stg, prd)"
  type  = string
  
}