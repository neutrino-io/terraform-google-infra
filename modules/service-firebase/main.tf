data "google_project" "default" {
}

data "google_client_openid_userinfo" "gcloud-user" {
  provider = google-beta
}

data "google_service_account" "service_account" {
  provider     = google-beta
  project      = data.google_project.default.project_id
  account_id   = "terraform-admin"
}

# Enable required services on the project
resource "google_project_service" "firebase_services" {
  count   = length(var.firebase_services)
  project = var.project_id
  service = element(var.firebase_services, count.index)

  disable_on_destroy = false
  disable_dependent_services = true
}

# Configuring Firebase project
resource "google_firebase_project" "default" {
  provider = google-beta
  project  = data.google_project.default.project_id

  depends_on = [google_project_service.firebase_services]
}

resource "google_firebase_project_location" "basic" {
  provider = google-beta
  project = data.google_project.default.project_id
  location_id = "asia-southeast1"

  depends_on = [google_project_service.firebase_services]
}

# Configuring Firebase app
resource "google_firebase_web_app" "basic" {
  provider   = google-beta
  project = data.google_project.default.project_id
  display_name = "${var.app_org_id}-${var.env}"

  depends_on = [
    google_project_service.firebase_services,
    google_firebase_project.default
  ]
}

data "google_firebase_web_app_config" "basic" {
  provider   = google-beta
  web_app_id = google_firebase_web_app.basic.app_id
}

# Create FireStore database
#resource "google_app_engine_application" "app" {
#  provider = google-beta
#  project       = data.google_project.default.project_id
#  location_id   = var.region
#  database_type = "CLOUD_FIRESTORE"
#
#  depends_on = [
#    google_project_service.firebase_services,
#  ]
#}

output "firebase_services" {
  value = google_project_service.firebase_services
}