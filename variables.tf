variable "volume" {
  type = object({
    name             = string
    catalog_name     = string
    schema_name      = string
    storage_location = string
    owner            = optional(string)
    volume_type      = optional(string, "EXTERNAL")
    comment          = optional(string, "External volume provisioned by Terraform")
  })
  description = "Configuration options for Volumes"
}

variable "permissions" {
  type = list(object({
    principal  = string
    privileges = set(string)
  }))
  description = "List of objects with volume permissions configuration"
  default     = []
}
