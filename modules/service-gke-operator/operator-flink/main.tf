resource "kubernetes_namespace" "system_flink" {
  metadata {
    labels = {
        app = var.app_org_id
        system = "flink"
    }

    name = "system-flink"
  }
}


resource "helm_release" "flink_operator" {
  name       = "flink-operator"
  namespace  = "system-flink"
  repository = "https://downloads.apache.org/flink/flink-kubernetes-operator-1.3.1/"
  chart      = "flink-kubernetes-operator"

  set {
    name = "webhook.create"
    value = false
  }

  depends_on = [
    kubernetes_namespace.system_flink
  ]
}