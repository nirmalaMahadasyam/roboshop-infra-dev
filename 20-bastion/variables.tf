variable "project_name" {
    default = "roboshop"
}

variable "environment_name" {
    default = "dev"
}

variable "common_tags" {
    default = {
        Project = "roboshop"
        Terraform = "true"
        Environment = "dev"
    }
}

variable "bastion_tags" {
    default = {
        Component = "bastion"
    }
}
