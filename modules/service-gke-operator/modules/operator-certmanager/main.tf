locals {
  name               = "certmanager"
  operator_version   = tostring(var.operator_version) != null ? var.operator_version : "1.11.0"
  operator_namespace = tostring(var.operator_namespace) != null ? var.operator_namespace : "neutrino-certmanager"
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
  name       = "${local.name}-operator"
  namespace  = local.operator_namespace
  repository = "https://charts.jetstack.io"
  chart      = "cert-manager"
  version    = local.operator_version

  set {
    name  = "InstallCRDs"
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
    kubernetes_namespace.system_certmanager
  ]
}

