variable "service_slug" {
  type        = string
  description = "The service slug"
}

variable "repository_name" {
  type        = string
  description = "The repository name"
}

variable "logs_bucket_name" {
  type        = string
  description = "The bucket for logs"
}

variable "root_domain" {
  type        = string
  description = "The root domain"
}

variable "subdomain" {
  type        = string
  description = "The subdomain for the cdn"
  default     = ""
}

variable "cdn_stages" {
  type = map(
    object({
      domains          = optional(list(string))
      subdomain_suffix = optional(string)
      certificate_arn  = optional(string)
    })
  )
  description = "Stage configuration, keyed by stage name"
}
