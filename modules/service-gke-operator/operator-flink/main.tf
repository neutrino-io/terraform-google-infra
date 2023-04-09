locals {
  name               = "flink"
  operator_version   = var.operator_version != null ? var.operator_version : "1.3.1"
  operator_namespace = var.operator_namespace != null ? var.operator_namespace : "neutrino-flink"
}

resource "kubernetes_namespace" "system_flink" {
  metadata {
    labels = {
      app    = var.app_org_id
      system = local.name
    }

    name = local.operator_namespace
  }
}


resource "helm_release" "flink_operator" {
  name       = "${local.name}-operator"
  namespace  = local.operator_namespace
  repository = "https://downloads.apache.org/flink/flink-kubernetes-operator-${local.operator_version}/"
  chart      = "flink-kubernetes-operator"

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
    kubernetes_namespace.system_flink
  ]
}