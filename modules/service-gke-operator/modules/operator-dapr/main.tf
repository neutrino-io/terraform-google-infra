locals {
  name               = "dapr"
  operator_version   = tostring(var.operator_version) != null ? var.operator_version : "1.10.4"
  operator_namespace = tostring(var.operator_namespace) != null ? var.operator_namespace : "neutrino-dapr"
}

resource "kubernetes_namespace" "system_dapr" {
  metadata {
    labels = {
      app    = var.app_org_id
      system = local.name
    }

    name = local.operator_namespace
  }
}

resource "helm_release" "dapr_operator" {
  name       = "${local.name}-operator"
  namespace  = local.operator_namespace
  repository = "https://dapr.github.io/helm-charts/"
  chart      = "dapr"
  version    = local.operator_version

  dynamic "set" {
    for_each = var.operator_settings == null ? {} : var.operator_settings

    content {
      name  = set.key
      value = set.value
    }
  }

  depends_on = [
    kubernetes_namespace.system_dapr
  ]
}
