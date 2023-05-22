resource "kubernetes_secret" "dns-admin" {
  metadata {
     name = "dns-admin-credentials"
     annotations = {
       "kubernetes.io/service-account.name" = "dns-admin"
     }
   }

   type = "kubernetes.io/service-account-token"
 }