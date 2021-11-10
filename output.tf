output "service_slug" {
  value       = var.service_slug
  description = "Re-output of var.service_slug"
}

output "repository_name" {
  value       = var.repository_name
  description = "Re-output of var.repository_name"
}

output "stage_config" {
  value = {
    for cdn in module.aws_cdn :
    cdn.stage => {
      distribution_id = cdn.distribution_id
      service_slug    = cdn.service_slug
      service_name    = cdn.service_name
      domain          = cdn.domain
      origins         = cdn.origins
    }
  }
  description = "A map of CDN stages, keyed by stage"
}

output "deployer_credentials" {
  value = {
    access_key = module.aws_iam.deployer_access_key
    secret_key = module.aws_iam.deployer_secret_key
  }
  sensitive   = true
  description = "The Access Key and Secret Key for CDN deployments for this repository"
}
