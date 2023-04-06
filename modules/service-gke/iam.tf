# Create the vault service account
resource "google_service_account" "cluster_core" {
  account_id   = "cluster-core-admin"
  display_name = "Cluster core admin"
  project      = var.project_id
}

# Add the service account to the project
resource "google_project_iam_member" "cluster_core_iam" {
  count   = length(var.service_account_iam_roles)
  project = var.project_id
  role    = element(var.service_account_iam_roles, count.index)
  member  = "serviceAccount:${google_service_account.cluster_core.email}"
}

# Service account binding
resource "google_service_account_iam_binding" "cluster_core_iam" {
  service_account_id = google_service_account.cluster_core.id
  role               = "roles/iam.serviceAccountUser"
  members            = ["serviceAccount:provisioner@${var.project_id}.iam.gserviceaccount.com"]
}