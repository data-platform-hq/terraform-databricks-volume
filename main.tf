locals {
  # Maps 'external_volumes' object, conditionally validates if 'name' parameter is provided
  external_volumes_mapped = {
    for object in var.external_volumes : object.name => object
    if length(object.name) != 0
  }
}

resource "databricks_volume" "this" {
  for_each = local.external_volumes_mapped

  name             = each.key
  catalog_name     = each.value.catalog_name
  schema_name      = each.value.schema_name
  volume_type      = each.value.volume_type
  owner            = each.value.owner
  storage_location = each.value.storage_location
  comment          = each.value.comment
}
