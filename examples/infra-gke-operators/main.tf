module "google-infra-gke" {
  source = "../../"

  app_org_id                  = var.app_org_id
  project_id                  = var.project_id
  region                      = var.region
  zone_default                = var.zone_default
  env                         = var.env
  app_domain                  = var.app_domain
  client_id                   = var.client_id
  client_secret               = var.client_secret
  enable_service_gke          = true
  enable_service_gke_operator = true
  enable_service_firebase     = false
  service_gke_operators = [
    {
      name    = "traefik"
      enabled = true
      version = "10.23.0"
      settings = {
        "additionalArguments"             = "{--entryPoints.kafka-broker.address=:19091/tcp}"
        "additionalArguments"             = "{--entryPoints.postgres.address=:5432/tcp}"
        "ports.kafka-broker2.expose"      = "true"
        "ports.kafka-broker2.port"        = "19092"
        "ports.kafka-broker2.exposedPort" = "19092"
        "ports.kafka-broker2.protocol"    = "TCP"
        "ports.kafka-broker3.expose"      = "true"
        "ports.kafka-broker3.port"        = "19093"
        "ports.kafka-broker3.exposedPort" = "19093"
        "ports.kafka-broker3.protocol"    = "TCP"
      }
    },
    {
      name    = "strimzi"
      enabled = true
    }
  ]
}
