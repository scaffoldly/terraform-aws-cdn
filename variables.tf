variable "service_name" {
  type        = string
  description = "The service name"
}

variable "repository_name" {
  type        = string
  description = "The repository name"
}

variable "logs_bucket_name" {
  type        = string
  description = "The bucket for logs"
}

variable "stages" {
  type = map(
    object({
      domains         = optional(list(string))
      certificate_arn = optional(string)
    })
  )
  description = "Stage configuration, keyed by stage name"
}
