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


variable "zone_name" {
    //default = "daws81s.online"
    default = "nirmaladevops.cloud"
}

variable "zone_id" {
    //default = "Z09912121MS725XSKH1TG"
    default = "Z03763011XJRNCF5S8GAY" // my account zoneid(r53)
}
