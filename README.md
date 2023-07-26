# Databricks Workspace Terraform module
Terraform module used for Databricks Volumes (External by default) creation.

## Usage
This module provides an ability to create Volumes in Databricks Unity Catalog

```hcl
locals {
  external_volumes = [
    {
      name             = "test-data-storage-eastus"
      catalog_name     = "project-catalog"
      schema_name      = "testing"
      owner            = "username@domain.com"
      comment          = "Testing Data Volume"
      storage_location = "abfss://data-test.name@$projectstorageeastus.dfs.core.windows.net"
    }
    ]
}

# Databricks Provider configuration
provider "databricks" {
  alias                       = "main"
  host                        = data.azurerm_databricks_workspace.example.workspace_url
  azure_workspace_resource_id = data.azurerm_databricks_workspace.example.id
}

module "databricks_volumes" {
  source = "data-platform-hq/databricks-ws/volumes"

  external_volumes = local.external_volumes

  providers = {
    databricks = databricks.main
  }
}
```
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name                                                                         | Version   |
| ---------------------------------------------------------------------------- |-----------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform)    | >= 1.0.0  |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm)          | >= 3.40.0 |
| <a name="requirement_databricks"></a> [databricks](#requirement\_databricks) | >= 1.19.2 |

## Providers

| Name                                                                   | Version |
| ---------------------------------------------------------------------- |---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm)          | 3.40.0  |
| <a name="provider_databricks"></a> [databricks](#provider\_databricks) | 1.19.2  |

## Modules

No modules.

## Resources

| Name                                                                                                                   | Type     |
|------------------------------------------------------------------------------------------------------------------------| -------- |
| [databricks_volume.this](https://registry.terraform.io/providers/databricks/databricks/latest/docs/resources/volume)   | resource |

## Inputs

| Name                                                                                 | Description                                | Type                                                                                                                                                                                                                                                                                                                                                     | Default | Required |
|--------------------------------------------------------------------------------------|--------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|---------|:--------:|
| <a name="input_external_volumes"></a> [external\_volumes](#input\_external\_volumes) | Configuration options for External Volumes | <pre>list(object({<br>  name             = string<br>  catalog_name     = string<br>  schema_name      = string<br>  storage_location = optional(string)<br>  owner            = optional(string)<br>  volume_type      = optional(string, "EXTERNAL")<br>  comment          = optional(string, "External volume provisioned by Terraform")<br>}))</pre> | []      |    no    |



## Outputs

<!-- END_TF_DOCS -->

## License

Apache 2 Licensed. For more information please see [LICENSE](https://github.com/data-platform-hq/terraform-databricks-volumes/blob/main/LICENSE)
