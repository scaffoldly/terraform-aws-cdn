terraform {
  required_version = ">= 1.0.0, < 1.1.0"

  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }

  experiments = [module_variable_optional_attrs]
}
