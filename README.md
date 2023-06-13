[![GitHub tag (latest SemVer)](https://img.shields.io/github/tag/neutrino-io/terraform-google-infra.svg?label=latest)](https://github.com/neutrino-io/terraform-google-infra/releases/latest)
![Terraform Version](https://img.shields.io/badge/tf-%3E%3D1.0.x-blue.svg)

# Neutrino Platform Builder - GCP Infrastructure

## Pre Requisite

- Complete setup of Google Foundation module
- Running post foundation setup script `PROJECT_ID=neutrino-develop-g1-f1f1f ACCOUNT_EMAIL=user@neutrino.sh IAP_SUPPORT_EMAIL=support@neutrino.sh APP_ORG_LABEL="Neutrino" ./foundation-post.sh`
- Manually enable the Identity Platform API in the GCP console at https://console.cloud.google.com/customer-identity

### Post Deployment

- Manually add NS record of subdomain to parent domain
- Run `kubectl create clusterrolebinding deployment-controller --clusterrole=cluster-admin --serviceaccount=kube-system:deployment-controller`
- Run `kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | grep deployment-controller | awk '{print $1}')`

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_google.impersonated"></a> [google.impersonated](#provider\_google.impersonated) | 4.63.1 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_domain"></a> [app\_domain](#input\_app\_domain) | Application domain | `string` | n/a | yes |
| <a name="input_app_org_id"></a> [app\_org\_id](#input\_app\_org\_id) | Application organization ID | `string` | n/a | yes |
| <a name="input_client_id"></a> [client\_id](#input\_client\_id) | GCP client ID | `string` | n/a | yes |
| <a name="input_client_secret"></a> [client\_secret](#input\_client\_secret) | GCP client secret | `string` | n/a | yes |
| <a name="input_enable_service_firebase"></a> [enable\_service\_firebase](#input\_enable\_service\_firebase) | Enable Firebase service | `bool` | `false` | no |
| <a name="input_enable_service_gke"></a> [enable\_service\_gke](#input\_enable\_service\_gke) | Enable GKE service | `bool` | `false` | no |
| <a name="input_enable_service_gke_operator"></a> [enable\_service\_gke\_operator](#input\_enable\_service\_gke\_operator) | Enable GKE Operator service | `bool` | `false` | no |
| <a name="input_env"></a> [env](#input\_env) | Project environment | `string` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | GCP project ID | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | GCP project region | `string` | n/a | yes |
| <a name="input_service_gke_operators"></a> [service\_gke\_operators](#input\_service\_gke\_operators) | GKE Operators configurations | <pre>list(object({<br>    name      = string<br>    enabled   = bool<br>    version   = optional(string)<br>    namespace = optional(string)<br>    settings  = optional(map(string))<br>  }))</pre> | <pre>[<br>  {<br>    "enabled": true,<br>    "name": "traefik"<br>  }<br>]</pre> | no |
| <a name="input_zone_default"></a> [zone\_default](#input\_zone\_default) | GCP project default zone | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_kms_key_ring_common"></a> [kms\_key\_ring\_common](#output\_kms\_key\_ring\_common) | KMS Key Ring Common |
| <a name="output_service"></a> [service](#output\_service) | Project Services |
| <a name="output_vpc"></a> [vpc](#output\_vpc) | Project VPC |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## What's a Module?

A Module is a canonical, reusable, best-practices definition for how to run a single piece of infrastructure, such
as a database or server cluster. Each Module is written using a combination of [Terraform](https://www.terraform.io/)
and scripts (mostly bash) and include automated tests, documentation, and examples. It is maintained both by the open
source community and companies that provide commercial support.

Instead of figuring out the details of how to run a piece of infrastructure from scratch, you can reuse
existing code that has been proven in production. And instead of maintaining all that infrastructure code yourself,
you can leverage the work of the Module community to pick up infrastructure improvements through
a version number bump.

## Who maintains this Module?

This Module and its Submodules are maintained by [Nematix](https://nematix.com/). If you are looking for help or
commercial support, email [support@nematix.com](mailto:support@nematix.com?Subject=Terraform%20Modules).

Nematix can help with:

- Setup, customization, and support for this Module.
- Modules and submodules for other types of infrastructure, such as VPCs, Docker clusters, databases, and continuous
  integration.
- Consulting & Training on AWS, Terraform, and DevOps.

## How is this Module versioned?

This Module follows the principles of [Semantic Versioning](http://semver.org/).

During initial development, the major version will be 0 (e.g., `0.x.y`), which indicates the code does not yet have a
stable API. Once we hit `1.0.0`, we will make every effort to maintain a backwards compatible API and use the MAJOR,
MINOR, and PATCH versions on each release to indicate any incompatibilities.

## License

Please see [LICENSE](https://github.com/neutrino-io/terraform-google-foundation/blob/master/LICENSE) for how the code in
this repo is licensed.