locals {
  name               = "traefik"
  operator_version   = var.operator_version != null ? var.operator_version : "22.1.0"
  operator_namespace = var.operator_namespace != null ? var.operator_namespace : "neutrino-traefik"
}

resource "kubernetes_namespace" "system_traefik" {
  metadata {
    labels = {
      app    = var.app_org_id
      system = local.name
    }

    name = local.operator_namespace
  }
}

resource "helm_release" "traefik" {
  name       = "${local.name}-operator"
  namespace  = local.operator_namespace
  repository = "https://helm.traefik.io/traefik"
  chart      = "traefik"
  version    = local.operator_version

  set {
    name  = "providers.kubernetesCRD.enabled"
    value = true
  }

  dynamic "set" {
    for_each = var.operator_settings == null ? {} : var.operator_settings

    content {
      name  = set.key
      value = set.value
    }
  }

  depends_on = [
    kubernetes_namespace.system_traefik
  ]
}