# Neutrino Platform Builder

## GCP Infra Service GKE Operator

Kubernetes Operators for GKE, following list of operators are available:

| Name          | Description                                   | Key           |
|---------------|-----------------------------------------------|---------------|
| CloudNativePG | CloudNative Operator for Postgres cluster     | cloudnativepg |
| Traefik       | Traefik Operator                              | traefik       |
| Dapr          | Dapr Operator distributed application runtime | dapr          |
| Flink         | Flink Operator                                | flink         |
| Strimzi       | Strimzi Operator for Kafka cluster            | strimzi       |
| Rook          | Rook Operator distributed storage cluster     | rook          |

### Deploying an Operator

By default, no operator is deployed, to deploy an operator, you need to add the operator key to the `gke_operators` variable.
The Helm settings can be passed as a map to the `settings` variable for each of the operator

```hcl
module "gke-operator" {
  # ...

  gke_operators = [
    {
      name    = "cloudnativepg"
      enabled = true
    }, {
      name    = "traefik"
      enabled = true
      settings = {
        "additionalArguments" = "{--entryPoints.kafka-broker.address=:19091/tcp}"
      }
    }
  ]
}
```
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Providers

No providers.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_org_id"></a> [app\_org\_id](#input\_app\_org\_id) | Application organization ID | `any` | n/a | yes |
| <a name="input_gke_cluster_ca"></a> [gke\_cluster\_ca](#input\_gke\_cluster\_ca) | GKE cluster CA | `any` | n/a | yes |
| <a name="input_gke_endpoint"></a> [gke\_endpoint](#input\_gke\_endpoint) | GKE endpoint | `any` | n/a | yes |
| <a name="input_gke_master_auth"></a> [gke\_master\_auth](#input\_gke\_master\_auth) | GKE master auth | `any` | n/a | yes |
| <a name="input_gke_operators"></a> [gke\_operators](#input\_gke\_operators) | Enable operators and its setting | <pre>list(object({<br>    name      = string<br>    enabled   = bool<br>    version   = optional(string)<br>    namespace = optional(string)<br>    settings  = optional(map(string))<br>  }))</pre> | <pre>[<br>  {<br>    "enabled": true,<br>    "name": "traefik"<br>  }<br>]</pre> | no |
| <a name="input_google_access_token"></a> [google\_access\_token](#input\_google\_access\_token) | Google access token | `any` | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## License

Please see [LICENSE](https://github.com/neutrino-io/terraform-google-foundation/blob/master/LICENSE) for how the code in
this repo is licensed.