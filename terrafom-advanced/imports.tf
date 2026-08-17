/*
import {
    id = "i-0ad873c6623321f05"
    to = aws_instance.my_existing_instance
}
*/

resource "aws_instance" "my_existing_instance" {
    # This resource is imported from an existing EC2 instance
    # The instance ID is specified in the import block above
    # The rest of the configuration can be defined as needed
}