# Neutrino Platform Builder

## GCP Infra Service Firebase

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 4.61.0 |
| <a name="provider_google-beta"></a> [google-beta](#provider\_google-beta) | 4.61.0 |
| <a name="provider_local"></a> [local](#provider\_local) | 2.4.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_domain"></a> [app\_domain](#input\_app\_domain) | Domain name | `string` | n/a | yes |
| <a name="input_app_org_id"></a> [app\_org\_id](#input\_app\_org\_id) | Organisation name | `string` | n/a | yes |
| <a name="input_env"></a> [env](#input\_env) | GCP Project environment | `string` | n/a | yes |
| <a name="input_firebase_services"></a> [firebase\_services](#input\_firebase\_services) | List of services to enable for Firebase service | `list(string)` | <pre>[<br>  "firebase.googleapis.com",<br>  "firestore.googleapis.com"<br>]</pre> | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | GCP project ID | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | GCP project region | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_firebase_services"></a> [firebase\_services](#output\_firebase\_services) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## License

Please see [LICENSE](https://github.com/neutrino-io/terraform-google-foundation/blob/master/LICENSE) for how the code in
this repo is licensed.