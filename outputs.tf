output "volumes" {
  value = [for key in keys(local.external_volumes_mapped) : {
    volume_name      = databricks_volume.this[key].name
    storage_location = databricks_volume.this[key].storage_location
    catalog_name     = databricks_volume.this[key].catalog_name
    schema_name      = databricks_volume.this[key].schema_name
  }]
  description = "Object with External Location parameters, like volume name, storage location path, catalog name and schema name"
}
