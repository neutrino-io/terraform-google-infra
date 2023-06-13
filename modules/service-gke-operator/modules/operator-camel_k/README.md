# Camel-K Operator

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 4.62.0 |
| <a name="provider_google-beta"></a> [google-beta](#provider\_google-beta) | 4.62.0 |
| <a name="provider_helm"></a> [helm](#provider\_helm) | 2.9.0 |
| <a name="provider_kubectl"></a> [kubectl](#provider\_kubectl) | 1.14.0 |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | 2.19.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_org_id"></a> [app\_org\_id](#input\_app\_org\_id) | Application organization ID | `string` | n/a | yes |
| <a name="input_operator_namespace"></a> [operator\_namespace](#input\_operator\_namespace) | Operator namespace | `string` | `""` | no |
| <a name="input_operator_settings"></a> [operator\_settings](#input\_operator\_settings) | Operator settings | `map(string)` | `{}` | no |
| <a name="input_operator_version"></a> [operator\_version](#input\_operator\_version) | Operator version | `string` | `""` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | GCP project ID | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
