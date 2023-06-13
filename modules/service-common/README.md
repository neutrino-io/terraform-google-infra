# Neutrino Platform Builder

## GCP Infra Service Common

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 4.61.0 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.5.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_domain"></a> [app\_domain](#input\_app\_domain) | Application domain | `string` | n/a | yes |
| <a name="input_app_org_id"></a> [app\_org\_id](#input\_app\_org\_id) | Organisation name | `string` | n/a | yes |
| <a name="input_client_id"></a> [client\_id](#input\_client\_id) | GCP client ID | `string` | n/a | yes |
| <a name="input_client_secret"></a> [client\_secret](#input\_client\_secret) | GCP client secret | `string` | n/a | yes |
| <a name="input_env"></a> [env](#input\_env) | GCP Project environment | `string` | n/a | yes |
| <a name="input_kms_key_ring"></a> [kms\_key\_ring](#input\_kms\_key\_ring) | String value to use for the name of the KMS key ring. This exists for backwards-compatability for users of the existing configurations. Please use kms\_key\_ring\_prefix instead. | `string` | `""` | no |
| <a name="input_primary_private_cidr"></a> [primary\_private\_cidr](#input\_primary\_private\_cidr) | Private subnet | `string` | `"10.26.1.0/24"` | no |
| <a name="input_primary_public_cidr"></a> [primary\_public\_cidr](#input\_primary\_public\_cidr) | Public subnet | `string` | `"10.26.2.0/24"` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | GCP project ID | `string` | n/a | yes |
| <a name="input_project_services"></a> [project\_services](#input\_project\_services) | List of services to enable on the project. | `list(string)` | <pre>[<br>  "identitytoolkit.googleapis.com",<br>  "cloudkms.googleapis.com",<br>  "servicenetworking.googleapis.com",<br>  "compute.googleapis.com",<br>  "logging.googleapis.com",<br>  "monitoring.googleapis.com",<br>  "dns.googleapis.com",<br>  "appengine.googleapis.com",<br>  "container.googleapis.com"<br>]</pre> | no |
| <a name="input_region"></a> [region](#input\_region) | GCP project region | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_kms_key_ring_common"></a> [kms\_key\_ring\_common](#output\_kms\_key\_ring\_common) | n/a |
| <a name="output_managed_zone"></a> [managed\_zone](#output\_managed\_zone) | n/a |
| <a name="output_primary_subnet_private"></a> [primary\_subnet\_private](#output\_primary\_subnet\_private) | n/a |
| <a name="output_primary_subnet_public"></a> [primary\_subnet\_public](#output\_primary\_subnet\_public) | n/a |
| <a name="output_service"></a> [service](#output\_service) | n/a |
| <a name="output_vpc"></a> [vpc](#output\_vpc) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## License

Please see [LICENSE](https://github.com/neutrino-io/terraform-google-foundation/blob/master/LICENSE) for how the code in
this repo is licensed.
