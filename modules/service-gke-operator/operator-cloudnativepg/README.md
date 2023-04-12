# CloudNativePG Operator

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_helm"></a> [helm](#provider\_helm) | 2.9.0 |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | 2.19.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_org_id"></a> [app\_org\_id](#input\_app\_org\_id) | Application organization ID | `any` | n/a | yes |
| <a name="input_enable_registry_operator"></a> [enable\_registry\_operator](#input\_enable\_registry\_operator) | Enable registry operator | `bool` | `false` | no |
| <a name="input_operator_namespace"></a> [operator\_namespace](#input\_operator\_namespace) | Operator namespace | `string` | `""` | no |
| <a name="input_operator_settings"></a> [operator\_settings](#input\_operator\_settings) | Operator settings | `map(string)` | `{}` | no |
| <a name="input_operator_version"></a> [operator\_version](#input\_operator\_version) | Operator version | `string` | `""` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
