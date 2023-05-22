locals {
  name               = "contour"
  operator_version   = tostring(var.operator_version) != null ? var.operator_version : "1.11.0"
  operator_namespace = tostring(var.operator_namespace) != null ? var.operator_namespace : "neutrino-cert-manager"
}

resource "kubernetes_namespace" "system_certmanager" {
  metadata {
    labels = {
      app    = var.app_org_id
      system = local.name
    }

    name = local.operator_namespace
  }
}

resource "helm_release" "cert_manager" {
  name       = "cert-manager"
  namespace  = "system-certmanager"
  repository = "https://charts.jetstack.io"
  chart      = "cert-manager"
  version    = "1.11.0"

  depends_on = [
    kubernetes_namespace.system_certmanager
  ]
}

set {
    name    = InstallCRDs
    value   = true
}