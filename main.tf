resource "databricks_volume" "this" {
  name             = var.volume.name
  catalog_name     = var.volume.catalog_name
  schema_name      = var.volume.schema_name
  volume_type      = var.volume.volume_type
  owner            = var.volume.owner
  storage_location = var.volume.storage_location
  comment          = var.volume.comment
}

resource "databricks_grants" "volume" {
  volume = databricks_volume.this.id

  dynamic "grant" {
    for_each = var.permissions
    content {
      principal  = grant.value.principal
      privileges = grant.value.privileges
    }
  }
}
