resource "kubernetes_namespace" "system_rook" {
  metadata {
    labels = {
        app = var.app_org_id
        system = "rook"
    }

    name = "system-rook"
  }
}

resource "helm_release" "rook_operator" {
  name       = "rook-operator"
  namespace  = "system-rook"
  repository = "https://charts.rook.io/release"
  chart      = "rook-ceph"
  version    = "v1.9.3"

  depends_on = [
    kubernetes_namespace.system_rook
  ]
}