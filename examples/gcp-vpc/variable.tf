# Input variables let you customize aspects of Terraform modules without altering the module's own 
# source code. This allows you to share modules across different Terraform configurations, making 
# your module composable and reusable.
#
# Terraform CLI defines the following optional arguments for variable declarations:
#   default - A default value which then makes the variable optional.
#   type - This argument specifies what value types are accepted for the variable.
#   description - This specifies the input variable's documentation.
#   validation - A block to define validation rules, usually in addition to type constraints.
#   sensitive - Limits Terraform UI output when the variable is used in configuration.
variable project {
  type        = string
  default     = "sandbox"
  description = "Project ID to host the resources provisioned"
}
