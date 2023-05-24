locals {
  name               = "keda"
  operator_version   = tostring(var.operator_version) != null ? var.operator_version : "2.10.2"
  operator_namespace = tostring(var.operator_namespace) != null ? var.operator_namespace : "neutrino-keda"
}

resource "kubernetes_namespace" "system_keda" {
  metadata {
    labels = {
      app    = var.app_org_id
      system = local.name
    }

    name = local.operator_namespace
  }
}


resource "helm_release" "keda_operator" {
  name       = "${local.name}-operator"
  namespace  = local.operator_namespace
  version    = local.operator_version
  repository = "https://kedacore.github.io/charts"
  chart      = "keda"

  set {
    name  = "webhook.create"
    value = false
  }

  dynamic "set" {
    for_each = var.operator_settings == null ? {} : var.operator_settings

    content {
      name  = set.key
      value = set.value
    }
  }

  depends_on = [
    kubernetes_namespace.system_keda
  ]
}
