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