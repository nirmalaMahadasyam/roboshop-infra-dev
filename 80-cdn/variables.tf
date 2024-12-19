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

variable "frontend_tags" {
    default = {
        Component = "frontend"
    }
}

variable "zone_name" {
    //default = "daws81s.online"
     default = "nirmaladevops.cloud"
}
