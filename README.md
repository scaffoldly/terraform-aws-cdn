[![Maintained by Scaffoldly](https://img.shields.io/badge/maintained%20by-scaffoldly-blueviolet)](https://github.com/scaffoldly)
![GitHub release (latest SemVer)](https://img.shields.io/github/v/release/scaffoldly/CHANGEME)
![Terraform Version](https://img.shields.io/badge/tf-%3E%3D1.0.4-blue.svg)

## Description

CHANGEME

## Usage

```hcl
module "CHANGME" {

}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0, < 1.1.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_aws_bucket"></a> [aws\_bucket](#module\_aws\_bucket) | scaffoldly/s3-private-versioned/aws | 1.0.0 |
| <a name="module_aws_cdn"></a> [aws\_cdn](#module\_aws\_cdn) | scaffoldly/cdn-stage/aws | 1.0.4 |
| <a name="module_aws_iam"></a> [aws\_iam](#module\_aws\_iam) | scaffoldly/cdn-iam/aws | 1.0.3 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cdn_stages"></a> [cdn\_stages](#input\_cdn\_stages) | Stage configuration, keyed by stage name | <pre>map(<br>    object({<br>      domains         = optional(list(string))<br>      certificate_arn = optional(string)<br>    })<br>  )</pre> | n/a | yes |
| <a name="input_logs_bucket_name"></a> [logs\_bucket\_name](#input\_logs\_bucket\_name) | The bucket for logs | `string` | n/a | yes |
| <a name="input_repository_name"></a> [repository\_name](#input\_repository\_name) | The repository name | `string` | n/a | yes |
| <a name="input_service_slug"></a> [service\_slug](#input\_service\_slug) | The service slug | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_bucket_name"></a> [bucket\_name](#output\_bucket\_name) | The bucket for deployments |
| <a name="output_deployer_credentials"></a> [deployer\_credentials](#output\_deployer\_credentials) | The Access Key and Secret Key for CDN deployments for this repository |
| <a name="output_repository_name"></a> [repository\_name](#output\_repository\_name) | Re-output of var.repository\_name |
| <a name="output_service_slug"></a> [service\_slug](#output\_service\_slug) | Re-output of var.service\_slug |
| <a name="output_stage_config"></a> [stage\_config](#output\_stage\_config) | A map of CDN stages, keyed by stage |
<!-- END_TF_DOCS -->
