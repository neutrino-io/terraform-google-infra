#data "google_firebase_web_app_config" "basic" {
#  provider   = google-beta
#  web_app_id = var.firebase_app_id
#}

#data "google_service_account" "sa-provisioner" {
#  provider     = google-beta
#  project      = var.project_id
#  account_id   = "provisioner"
#}

#
# Firebase credentials
#

#resource "google_service_account_key" "token_admin_key" {
#  service_account_id = data.google_service_account.sa-provisioner.name
#}
#
#resource "kubernetes_secret" "firebase_secret" {
#  metadata {
#    name = "firebase-secret"
#    namespace = "system-camel-k"
#  }
#  data = {
#    "firebase-config.json" = jsonencode({
#      firebase = {
#        appId             = var.firebase_app_id
#        apiKey            = data.google_firebase_web_app_config.basic.api_key
#        authDomain        = data.google_firebase_web_app_config.basic.auth_domain
#        databaseURL       = lookup(data.google_firebase_web_app_config.basic, "database_url", "")
#        storageBucket     = lookup(data.google_firebase_web_app_config.basic, "storage_bucket", "")
#        messagingSenderId = lookup(data.google_firebase_web_app_config.basic, "messaging_sender_id", "")
#        measurementId     = lookup(data.google_firebase_web_app_config.basic, "measurement_id", "")
#      }
#    })
#  }
#
#  depends_on = [
#    kubernetes_namespace.system-camel_k
#  ]
#}
#
#resource "kubernetes_secret" "firebase-jwt-token" {
#  metadata {
#    name = "firebase-jwt-token"
#    namespace = "system-camel-k"
#  }
#  data = {
#    "token" = jsonencode({
#      iss = data.google_service_account.sa-provisioner.email
#      sub = data.google_service_account.sa-provisioner.email
#      scope = "https://www.googleapis.com/auth/datastore"
#      aud = "https://oauth2.googleapis.com/token"
#      private_key = base64encode(jsondecode(base64decode(google_service_account_key.token_admin_key.private_key)).private_key)
#    })
#  }
#
#  depends_on = [
#    kubernetes_namespace.system-camel_k,
#    google_service_account_key.token_admin_key
#  ]
#}