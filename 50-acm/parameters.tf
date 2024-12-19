resource "aws_ssm_parameter" "https_certificate_arn" {
  name  = "/${var.project_name}/${var.environment_name}/https_certificate_arn"
  type  = "String"
  value = aws_acm_certificate.roboshop.arn
}