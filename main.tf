module "aws_iam" {
  source  = "scaffoldly/cdn-iam/aws"
  version = "1.0.7"

  repository_name = var.repository_name
}

module "aws_bucket" {
  source  = "scaffoldly/s3-private-versioned/aws"
  version = "1.0.1"

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
  version = "1.0.29"

  for_each = var.cdn_stages

  service_slug                    = var.service_slug
  repository_name                 = var.repository_name
  bucket_name                     = module.aws_bucket.bucket_name
  logs_bucket_name                = var.logs_bucket_name
  stage                           = each.key
  cloudfront_access_identity_path = module.aws_iam.cloudfront_access_identity_path
  certificate_arn                 = each.value.certificate_arn != null ? each.value.certificate_arn : ""
  root_domain                     = each.value.root_domain != null ? each.value.root_domain : "unknown-domain"
  subdomain                       = var.subdomain
  additional_subdomains           = var.additional_subdomains
  subdomain_suffix                = each.value.subdomain_suffix != null ? each.value.subdomain_suffix : ""
  cdn_domains                     = each.value.domains != null ? each.value.domains : []
  disable_cache_patterns          = var.disable_cache_patterns
  function_associations           = lookup(var.function_associations, each.key, {})

  providers = {
    aws.dns = aws.dns
  }
}
