locals {
  name               = "cloudnativepg"
  operator_version   = tostring(var.operator_version) != null ? var.operator_version : "0.17.1"
  operator_namespace = tostring(var.operator_namespace) != null ? var.operator_namespace : "neutrino-cloudnativepg"
}

resource "kubernetes_namespace" "system_cloudnativepg" {
  metadata {
    labels = {
      app    = var.app_org_id
      system = local.name
    }

    name = local.operator_namespace
  }
}

resource "helm_release" "cloudnativepg_operator" {
  name       = "${local.name}-operator"
  namespace  = local.operator_namespace
  repository = "https://cloudnative-pg.github.io/charts"
  chart      = "cloudnative-pg"
  version    = local.operator_version

  set {
    name  = "fullnameOverride"
    value = "${local.name}-operator"
  }

  dynamic "set" {
    for_each = var.operator_settings == null ? {} : var.operator_settings

    content {
      name  = set.key
      value = set.value
    }
  }

  depends_on = [
    kubernetes_namespace.system_cloudnativepg
  ]
}
