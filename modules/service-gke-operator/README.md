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

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 4.68.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_org_id"></a> [app\_org\_id](#input\_app\_org\_id) | Application organization ID | `string` | n/a | yes |
| <a name="input_gke_operators"></a> [gke\_operators](#input\_gke\_operators) | Enable operators and their settings | <pre>list(object({<br>    name      = string<br>    enabled   = bool<br>    version   = optional(string)<br>    namespace = optional(string)<br>    settings  = optional(map(string))<br>  }))</pre> | <pre>[<br>  {<br>    "enabled": true,<br>    "name": "traefik"<br>  }<br>]</pre> | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | Project ID | `string` | `""` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## License

Please see [LICENSE](https://github.com/neutrino-io/terraform-google-foundation/blob/master/LICENSE) for how the code in
this repo is licensed.