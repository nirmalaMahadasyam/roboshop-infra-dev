data "aws_cloudfront_cache_policy" "noCache" {
  name = "Managed-CachingDisabled"
}

data "aws_cloudfront_cache_policy" "cacheOptmised" {
  name = "Managed-CachingOptimized"
}

data "aws_ssm_parameter" "https_certificate_arn" {
  name = "/${var.project_name}/${var.environment_name}/https_certificate_arn"
}