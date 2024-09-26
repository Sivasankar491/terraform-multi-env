variable "instance-type" {
    type = map
}

variable "common-tags" {
    type = map
    default = {
        Project = "Expense"
        Terraform = "True"
    } 
}

variable "environment" {
    type = string
}

# variable "env-type" {
#     type = map
# }