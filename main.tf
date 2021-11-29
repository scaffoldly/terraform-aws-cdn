module "aws_iam" {
  source  = "scaffoldly/cdn-iam/aws"
  version = "1.0.3"

  repository_name = var.repository_name
}

module "aws_bucket" {
  source  = "scaffoldly/s3-private-versioned/aws"
  version = "1.0.0"

  bucket_name_prefix = var.repository_name

  read_only_principals = [
    module.aws_iam.cloudfront_access_identity_arn
  ]

  read_write_principals = [
    module.aws_iam.deployer_arn
  ]
}

module "aws_cdn" {
  source  = "scaffoldly/cdn-stage/aws"
  version = "1.0.10"

  for_each = var.cdn_stages

  service_slug                    = var.service_slug
  repository_name                 = var.repository_name
  bucket_name                     = module.aws_bucket.bucket_name
  logs_bucket_name                = var.logs_bucket_name
  stage                           = each.key
  cloudfront_access_identity_path = module.aws_iam.cloudfront_access_identity_path
  certificate_arn                 = each.value.certificate_arn != null ? each.value.certificate_arn : ""
  root_domain                     = var.root_domain

  # Logic info: if cdn_stages has domains, allow the custom domains, otherwise, will use the default CF domain (empty list)
  # TODO: possibly use setintersection() to ensure that var.domains is in each.value.domains
  domains = each.value.domains != null ? var.domains : []

  providers = {
    aws.dns = aws.dns
  }
}
