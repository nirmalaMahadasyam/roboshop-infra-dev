data "aws_ssm_parameter" "vpc_id" {
  name = "/${var.project_name}/${var.environment_name}/vpc_id"
}

data "aws_ssm_parameter" "public_subnet_ids" {
  #/roboshop/dev/private_subnet_ids
  name = "/${var.project_name}/${var.environment_name}/public_subnet_ids"
}

data "aws_ssm_parameter" "ingress_alb_sg_id" {
  name = "/${var.project_name}/${var.environment_name}/ingress_alb_sg_id"
}

data "aws_ssm_parameter" "https_certificate_arn" {
  name = "/${var.project_name}/${var.environment_name}/https_certificate_arn"
}
