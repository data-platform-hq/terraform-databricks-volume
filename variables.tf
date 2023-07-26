variable "external_volumes" {
  type = list(object({
    name             = string
    catalog_name     = string
    schema_name      = string
    storage_location = string
    owner            = optional(string)
    volume_type      = optional(string, "EXTERNAL")
    comment          = optional(string, "External volume provisioned by Terraform")
  }))
  description = "Configuration options for External Volumes"
  default     = []
}
