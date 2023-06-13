# Neutrino Platform Builder

## GCP Infra Service GKE

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 4.61.0 |
| <a name="provider_google-beta"></a> [google-beta](#provider\_google-beta) | 4.61.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_core_cidr"></a> [cluster\_core\_cidr](#input\_cluster\_core\_cidr) | Cluster core CIDR | `string` | `"10.1.0.0/16"` | no |
| <a name="input_env"></a> [env](#input\_env) | Project environment | `string` | n/a | yes |
| <a name="input_gke_services"></a> [gke\_services](#input\_gke\_services) | List of services to enable for GKE service | `list(string)` | <pre>[<br>  "container.googleapis.com",<br>  "artifactregistry.googleapis.com",<br>  "cloudbuild.googleapis.com"<br>]</pre> | no |
| <a name="input_k8s_master_ipv4_cidr"></a> [k8s\_master\_ipv4\_cidr](#input\_k8s\_master\_ipv4\_cidr) | The IP range in CIDR notation to use for the hosted master network. This range will be used for assigning internal IP addresses to the master or set of masters, as well as the ILB VIP. This range must not overlap with any other ranges in use within the cluster's network. | `string` | `"10.0.82.0/28"` | no |
| <a name="input_k8s_pod_ipv4_cidr"></a> [k8s\_pod\_ipv4\_cidr](#input\_k8s\_pod\_ipv4\_cidr) | The IP address range of the container pods in this cluster, in CIDR notation | `string` | `"10.4.0.0/16"` | no |
| <a name="input_k8s_secrets_crypto_key"></a> [k8s\_secrets\_crypto\_key](#input\_k8s\_secrets\_crypto\_key) | Name of the KMS key to use for encrypting the Kubernetes database. | `string` | `"kubernetes-secrets"` | no |
| <a name="input_k8s_service_ipv4_cidr"></a> [k8s\_service\_ipv4\_cidr](#input\_k8s\_service\_ipv4\_cidr) | The IP address range of the Kubernetes services in this cluster, in CIDR notation | `string` | `"10.8.0.0/16"` | no |
| <a name="input_kms_key_ring_common"></a> [kms\_key\_ring\_common](#input\_kms\_key\_ring\_common) | Common key ring | `any` | n/a | yes |
| <a name="input_org_id"></a> [org\_id](#input\_org\_id) | Organisation name | `string` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | GCP project ID | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | GCP project region | `string` | n/a | yes |
| <a name="input_service_account_iam_roles"></a> [service\_account\_iam\_roles](#input\_service\_account\_iam\_roles) | List of IAM roles to assign to the service account. | `list(string)` | <pre>[<br>  "roles/logging.logWriter",<br>  "roles/monitoring.metricWriter",<br>  "roles/monitoring.viewer",<br>  "roles/storage.objectViewer",<br>  "roles/stackdriver.resourceMetadata.writer",<br>  "roles/artifactregistry.reader"<br>]</pre> | no |
| <a name="input_vpc"></a> [vpc](#input\_vpc) | Cluster VPC | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ca_certificate"></a> [ca\_certificate](#output\_ca\_certificate) | Cluster ca certificate (base64 encoded) |
| <a name="output_cluster_core_address"></a> [cluster\_core\_address](#output\_cluster\_core\_address) | Cluster control address |
| <a name="output_endpoint"></a> [endpoint](#output\_endpoint) | Cluster endpoint |
| <a name="output_gke_service"></a> [gke\_service](#output\_gke\_service) | GKE related services |
| <a name="output_master_auth"></a> [master\_auth](#output\_master\_auth) | Cluster master auth |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## License

Please see [LICENSE](https://github.com/neutrino-io/terraform-google-foundation/blob/master/LICENSE) for how the code in
this repo is licensed.
