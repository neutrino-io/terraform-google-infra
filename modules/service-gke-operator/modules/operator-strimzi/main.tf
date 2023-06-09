locals {
  name               = "strimzi"
  operator_version   = tostring(var.operator_version) != null ? var.operator_version : "0.34.0"
  operator_namespace = tostring(var.operator_namespace) != null ? var.operator_namespace : "neutrino-strimzi"
}

resource "kubernetes_namespace" "system_strimzi" {
  metadata {
    labels = {
      app    = var.app_org_id
      system = local.name
    }

    name = local.operator_namespace
  }
}

resource "helm_release" "strimzi_operator" {
  name       = "${local.name}-operator"
  namespace  = local.operator_namespace
  repository = "https://strimzi.io/charts"
  chart      = "strimzi-kafka-operator"
  version    = local.operator_version

  set {
    name  = "watchAnyNamespace"
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
    kubernetes_namespace.system_strimzi
  ]
}

resource "helm_release" "strimzi_registry_operator" {
  count = var.enable_registry_operator ? 1 : 0

  name       = "strimzi-registry-operator"
  namespace  = local.operator_namespace
  repository = "https://lsst-sqre.github.io/charts"
  chart      = "strimzi-registry-operator"

  set {
    name  = "clusterName"
    value = "control-kafka"
  }

  set {
    name  = "clusterNamespace"
    value = local.operator_namespace
  }

  set {
    name  = "operatorNamespace"
    value = local.operator_namespace
  }

  depends_on = [
    kubernetes_namespace.system_strimzi
  ]
}
