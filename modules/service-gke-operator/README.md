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

## License

Please see [LICENSE](https://github.com/neutrino-io/terraform-google-foundation/blob/master/LICENSE) for how the code in
this repo is licensed.