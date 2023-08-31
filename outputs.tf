output "volume_name" {
  value       = databricks_volume.this.name
  description = "Volume name"
}

output "storage_location" {
  value       = databricks_volume.this.storage_location
  description = "URL of target Storage Account Filesystem"
}

output "catalog_name" {
  value       = databricks_volume.this.catalog_name
  description = "Catalog name where volume is created"
}

output "schema_name" {
  value       = databricks_volume.this.schema_name
  description = "Schema name where volume is created"
}
