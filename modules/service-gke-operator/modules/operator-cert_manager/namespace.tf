resource "kubernetes_namespace" "system_certmanager" {
  metadata {
    labels = {
        base = "foundry360"
        system = "certmanager"
    }

    name = "system-certmanager"
  }

  depends_on = [
    var.k8s_cluster_core
  ]
}