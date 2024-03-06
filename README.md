# Databricks Workspace Terraform module
Terraform module used for Databricks Volumes (External by default) creation.

## Usage
This module provides an ability to create Volume in Databricks Unity Catalog

```hcl
module "databricks_volumes" {
  source  = "data-platform-hq/databricks-ws/volumes"
  version = "~> 1.0" 

  volume = {
    name             = "test-data-storage-eastus"
    catalog_name     = "project-catalog"
    schema_name      = "testing"
    owner            = "username@domain.com"
    comment          = "Testing Data Volume"
    storage_location = "abfss://data-test.name@$projectstorageeastus.dfs.core.windows.net"
  }
  
  permissions = [{
    principal  = "account users"
    privileges = ["READ_VOLUME"]
    }]
}
```
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.0.0 |
| <a name="requirement_databricks"></a> [databricks](#requirement\_databricks) | >=1.19.2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_databricks"></a> [databricks](#provider\_databricks) | >=1.19.2 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [databricks_grants.volume](https://registry.terraform.io/providers/databricks/databricks/latest/docs/resources/grants) | resource |
| [databricks_volume.this](https://registry.terraform.io/providers/databricks/databricks/latest/docs/resources/volume) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_permissions"></a> [permissions](#input\_permissions) | List of objects with volume permissions configuration | <pre>list(object({<br>    principal  = string<br>    privileges = set(string)<br>  }))</pre> | `[]` | no |
| <a name="input_volume"></a> [volume](#input\_volume) | Configuration options for Volumes | <pre>object({<br>    name             = string<br>    catalog_name     = string<br>    schema_name      = string<br>    storage_location = string<br>    owner            = optional(string)<br>    volume_type      = optional(string, "EXTERNAL")<br>    comment          = optional(string, "External volume provisioned by Terraform")<br>  })</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_catalog_name"></a> [catalog\_name](#output\_catalog\_name) | Catalog name where volume is created |
| <a name="output_schema_name"></a> [schema\_name](#output\_schema\_name) | Schema name where volume is created |
| <a name="output_storage_location"></a> [storage\_location](#output\_storage\_location) | URL of target Storage Account Filesystem |
| <a name="output_volume_name"></a> [volume\_name](#output\_volume\_name) | Volume name |
<!-- END_TF_DOCS -->

## License

Apache 2 Licensed. For more information please see [LICENSE](https://github.com/data-platform-hq/terraform-databricks-external-volumes/blob/main/LICENSE)
