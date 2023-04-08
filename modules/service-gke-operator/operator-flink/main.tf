locals {
  name = "flink"
  flink_operator_version = var.flink_operator_version != "" ? var.flink_operator_version : "1.3.1"
  operator_namespace = "system-flink"
}

resource "kubernetes_namespace" "system_flink" {
  metadata {
    labels = {
        app = var.app_org_id
        system = local.name
    }

    name = local.operator_namespace
  }
}


resource "helm_release" "flink_operator" {
  name       = "${local.name}-operator"
  namespace  = local.operator_namespace
  repository = "https://downloads.apache.org/flink/flink-kubernetes-operator-${local.flink_operator_version}/"
  chart      = "flink-kubernetes-operator"

  set {
    name = "webhook.create"
    value = false
  }

  depends_on = [
    kubernetes_namespace.system_flink
  ]
}