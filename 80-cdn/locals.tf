locals {
    resource_name = "${var.project_name}-${var.environment_name}"
    https_certificate_arn = data.aws_ssm_parameter.https_certificate_arn.value
}