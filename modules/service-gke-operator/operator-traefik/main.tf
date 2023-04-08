locals {
  name                     = "traefik"
  traefik_operator_version = var.traefik_operator_version != "" ? var.traefik_operator_version : "10.23.0"
  operator_namespace       = "system-traefik"
}

resource "kubernetes_namespace" "system_traefik" {
  metadata {
    labels = {
        app = var.app_org_id
        system = "traefik"
    }

    name = local.operator_namespace
  }
}

locals {
  kafka_brokers = {
    1 = "broker1"
    2 = "broker2"
    3 = "broker3"
  }
}

resource "helm_release" "traefik" {
  name       = "${local.name}-operator"
  namespace  = local.operator_namespace
  repository = "https://helm.traefik.io/traefik"
  chart      = "traefik"
  version    = local.traefik_operator_version
  
  set {
    name  = "providers.kubernetesCRD.enabled"
    value = true
  }

  dynamic "set" {
    for_each = local.kafka_brokers

    content {
      name = "additionalArguments"
      value = "{--entryPoints.kafka${set.value}.address=:1909${set.key}/tcp}"
    }
  }

  dynamic "set" {
    for_each = local.kafka_brokers

    content {
      name = "ports.kafka${set.value}.port"
      value = "1909${set.key}"
    }
  }

  dynamic "set" {
    for_each = local.kafka_brokers

    content {
      name = "ports.kafka${set.value}.expose"
      value = true
    }
  }

  dynamic "set" {
    for_each = local.kafka_brokers

    content {
      name = "ports.kafka${set.value}.exposedPort"
      value = "1909${set.key}"
    }
  }

  dynamic "set" {
    for_each = local.kafka_brokers

    content {
      name = "ports.kafka${set.value}.protocol"
      value = "TCP"
    }
  }

  depends_on = [
    kubernetes_namespace.system_traefik
  ]
}