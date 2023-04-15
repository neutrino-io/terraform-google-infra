locals {
  name               = "openfunction"
  operator_version   = tostring(var.operator_version) != null ? var.operator_version : "0.4.0"
  operator_namespace = tostring(var.operator_namespace) != null ? var.operator_namespace : "openfunction"
}

resource "kubernetes_namespace" "system_openfunction" {
  metadata {
    labels = {
      app    = var.app_org_id
      system = local.name
    }

    name = local.operator_namespace
  }
}

resource "helm_release" "openfunction_operator" {
  name       = "${local.name}-operator"
  namespace  = local.operator_namespace
  repository = "https://openfunction.github.io/charts/"
  chart      = "openfunction"
  version    = local.operator_version

  #  set {
  #    name  = "config.knativeServingNamespace"
  #    value = "neutrino-knative"
  #  }
  #
  #  set {
  #    name  = "contour.namespaceOverride"
  #    value = "neutrino-contour"
  #  }

  dynamic "set" {
    for_each = var.operator_settings == null ? {} : var.operator_settings

    content {
      name  = set.key
      value = set.value
    }
  }

  depends_on = [
    kubernetes_namespace.system_openfunction
  ]
}