locals {
  name                  = "rook`"
  rook_operator_version = var.rook_operator_version != "" ? var.rook_operator_version : "v1.9.3"
  operator_namespace    = "system-rook"
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
  version    = local.rook_operator_version

  depends_on = [
    kubernetes_namespace.system_rook
  ]
}