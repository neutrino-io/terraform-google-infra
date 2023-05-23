locals {
  name               = "otel"
  operator_version   = var.operator_version == null ? "45.10.0" : var.operator_version
  operator_namespace = var.operator_namespace == null ? "neutrino-otel" : var.operator_namespace
}

resource "kubernetes_namespace" "system_otel" {
  metadata {
    labels = {
      app    = var.app_org_id
      system = local.name
    }

    name = local.operator_namespace
  }
}

resource "helm_release" "otel_operator" {
  name       = "${local.name}-operator"
  namespace  = local.operator_namespace
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "kube-prometheus-stack"
  version    = local.operator_version

  dynamic "set" {
    for_each = var.operator_settings == null ? {} : var.operator_settings

    content {
      name  = set.key
      value = set.value
    }
  }

  depends_on = [
    kubernetes_namespace.system_otel
  ]
}
