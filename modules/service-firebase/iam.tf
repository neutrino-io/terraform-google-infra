resource "google_service_account_iam_member" "grant-token-iam" {
  service_account_id = data.google_service_account.service_account.name
  role               = "roles/iam.serviceAccountTokenCreator"
  member             = "gcp-devops@${var.app_domain}"

  depends_on = [
    google_project_service.firebase_services
  ]

}

resource "google_service_account_iam_member" "firebase_update" {
  service_account_id = data.google_service_account.service_account.name
  role               = "roles/firebase.admin"
  member             = "gcp-devops@${var.app_domain}"

  depends_on = [
    google_project_service.firebase_services
  ]
}

# Write secrets to local file
#TODO: Create k8s secret instead of local file
resource "local_file" "firebase_config" {
  content = jsonencode({
    firebase = {
      appId             = google_firebase_web_app.basic.app_id
      apiKey            = data.google_firebase_web_app_config.basic.api_key
      authDomain        = data.google_firebase_web_app_config.basic.auth_domain
      databaseURL       = lookup(data.google_firebase_web_app_config.basic, "database_url", "")
      storageBucket     = lookup(data.google_firebase_web_app_config.basic, "storage_bucket", "")
      messagingSenderId = lookup(data.google_firebase_web_app_config.basic, "messaging_sender_id", "")
      measurementId     = lookup(data.google_firebase_web_app_config.basic, "measurement_id", "")
    }
  })
  filename = "./credentials/app/firebase-config.json"

  depends_on = [
    google_firebase_web_app.basic
  ]
}
