locals {
  name               = "rook"
  operator_version   = tostring(var.operator_version) != null ? var.operator_version : "v1.11.3"
  operator_namespace = tostring(var.operator_namespace) != null ? var.operator_namespace : "neutrino-rook"
}

resource "kubernetes_namespace" "system_rook" {
  metadata {
    labels = {
      app    = var.app_org_id
      system = local.name
    }

    name = local.operator_namespace
  }
}

resource "helm_release" "rook_operator" {
  name       = "${local.name}-operator"
  namespace  = local.operator_namespace
  repository = "https://charts.rook.io/release"
  chart      = "rook-ceph"
  version    = local.operator_version

  dynamic "set" {
    for_each = var.operator_settings == null ? {} : var.operator_settings

    content {
      name  = set.key
      value = set.value
    }
  }

  depends_on = [
    kubernetes_namespace.system_rook
  ]
}
