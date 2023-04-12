# Neutrino Platform Builder

## GCP Infra Service GKE

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 4.61.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_authorized_source_ranges"></a> [authorized\_source\_ranges](#input\_authorized\_source\_ranges) | Addresses or CIDR blocks which are allowed to connect to GKE API Server. | `list(string)` | <pre>[<br>  "0.0.0.0/0"<br>]</pre> | no |
| <a name="input_cluster_core_cidr"></a> [cluster\_core\_cidr](#input\_cluster\_core\_cidr) | n/a | `string` | `"10.1.0.0/16"` | no |
| <a name="input_env"></a> [env](#input\_env) | Project environment | `any` | n/a | yes |
| <a name="input_gke_services"></a> [gke\_services](#input\_gke\_services) | List of services to enable for GKE service | `list(string)` | <pre>[<br>  "container.googleapis.com",<br>  "artifactregistry.googleapis.com",<br>  "cloudbuild.googleapis.com"<br>]</pre> | no |
| <a name="input_k8s_instance_type"></a> [k8s\_instance\_type](#input\_k8s\_instance\_type) | n/a | `string` | `"e2-standard-2"` | no |
| <a name="input_k8s_master_ipv4_cidr"></a> [k8s\_master\_ipv4\_cidr](#input\_k8s\_master\_ipv4\_cidr) | n/a | `string` | `"10.0.82.0/28"` | no |
| <a name="input_k8s_nodes_per_zone"></a> [k8s\_nodes\_per\_zone](#input\_k8s\_nodes\_per\_zone) | Number of nodes to deploy in each zone of the Kubernetes cluster. For example, if there are 4 zones in the region and num\_nodes\_per\_zone is 2, 8 total nodes will be created. | `number` | `1` | no |
| <a name="input_k8s_num_nodes"></a> [k8s\_num\_nodes](#input\_k8s\_num\_nodes) | number of gke nodes | `number` | `2` | no |
| <a name="input_k8s_password"></a> [k8s\_password](#input\_k8s\_password) | gke password | `string` | `""` | no |
| <a name="input_k8s_pod_ipv4_cidr"></a> [k8s\_pod\_ipv4\_cidr](#input\_k8s\_pod\_ipv4\_cidr) | n/a | `string` | `"10.4.0.0/16"` | no |
| <a name="input_k8s_secrets_crypto_key"></a> [k8s\_secrets\_crypto\_key](#input\_k8s\_secrets\_crypto\_key) | Name of the KMS key to use for encrypting the Kubernetes database. | `string` | `"kubernetes-secrets"` | no |
| <a name="input_k8s_service_ipv4_cidr"></a> [k8s\_service\_ipv4\_cidr](#input\_k8s\_service\_ipv4\_cidr) | n/a | `string` | `"10.8.0.0/16"` | no |
| <a name="input_k8s_username"></a> [k8s\_username](#input\_k8s\_username) | gke username | `string` | `"cluster-admin"` | no |
| <a name="input_kms_key_ring_common"></a> [kms\_key\_ring\_common](#input\_kms\_key\_ring\_common) | Common key ring | `any` | n/a | yes |
| <a name="input_org_id"></a> [org\_id](#input\_org\_id) | Organisation name | `any` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | GCP project ID | `any` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | GCP project region | `any` | n/a | yes |
| <a name="input_service_account_iam_roles"></a> [service\_account\_iam\_roles](#input\_service\_account\_iam\_roles) | List of IAM roles to assign to the service account. | `list(string)` | <pre>[<br>  "roles/logging.logWriter",<br>  "roles/monitoring.metricWriter",<br>  "roles/monitoring.viewer",<br>  "roles/storage.objectViewer",<br>  "roles/stackdriver.resourceMetadata.writer",<br>  "roles/artifactregistry.reader"<br>]</pre> | no |
| <a name="input_vpc"></a> [vpc](#input\_vpc) | Cluster VPC | `any` | n/a | yes |
| <a name="input_zone_default"></a> [zone\_default](#input\_zone\_default) | GCP project zone default | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ca_certificate"></a> [ca\_certificate](#output\_ca\_certificate) | Cluster ca certificate (base64 encoded) |
| <a name="output_cluster_core_address"></a> [cluster\_core\_address](#output\_cluster\_core\_address) | n/a |
| <a name="output_endpoint"></a> [endpoint](#output\_endpoint) | Cluster endpoint |
| <a name="output_gke_service"></a> [gke\_service](#output\_gke\_service) | n/a |
| <a name="output_master_auth"></a> [master\_auth](#output\_master\_auth) | Cluster master auth |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## License

Please see [LICENSE](https://github.com/neutrino-io/terraform-google-foundation/blob/master/LICENSE) for how the code in
this repo is licensed.