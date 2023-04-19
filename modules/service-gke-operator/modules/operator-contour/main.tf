locals {
  name               = "contour"
  operator_version   = tostring(var.operator_version) != null ? var.operator_version : "11.1.2"
  operator_namespace = tostring(var.operator_namespace) != null ? var.operator_namespace : "neutrino-contour"
}

resource "kubernetes_namespace" "system_contour" {
  metadata {
    labels = {
      app    = var.app_org_id
      system = local.name
    }

    name = local.operator_namespace
  }
}

resource "helm_release" "contour" {
  name       = "${local.name}-operator"
  namespace  = local.operator_namespace
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "contour"
  version    = local.operator_version

  dynamic "set" {
    for_each = var.operator_settings == null ? {} : var.operator_settings

    content {
      name  = set.key
      value = set.value
    }
  }

  depends_on = [
    kubernetes_namespace.system_contour
  ]
}
