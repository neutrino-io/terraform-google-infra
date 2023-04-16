# Create the vault service account
resource "google_service_account" "cluster-control" {
  account_id   = "cluster-admin-${local.cluster_control_key}"
  display_name = "Admin of ${local.cluster_control_key} cluster"
  project      = var.project_id
}

# Add the service account to the project
resource "google_project_iam_member" "cluster-control-sa" {
  count   = length(var.service_account_iam_roles)
  project = var.project_id
  role    = element(var.service_account_iam_roles, count.index)
  member  = "serviceAccount:${google_service_account.cluster-control.email}"
}

# Service account binding
resource "google_service_account_iam_binding" "sa-provisioner" {
  service_account_id = google_service_account.cluster-control.id
  role               = "roles/iam.serviceAccountUser"
  members            = ["serviceAccount:provisioner@${var.project_id}.iam.gserviceaccount.com"]
}

resource "google_kms_crypto_key_iam_binding" "kubernetes-secrets" {
  crypto_key_id = local.kms_key_name
  role          = "roles/cloudkms.cryptoKeyEncrypterDecrypter"
  members = [
    "serviceAccount:service-${data.google_project.project.number}@container-engine-robot.iam.gserviceaccount.com",
    "serviceAccount:service-${data.google_project.project.number}@gcp-sa-artifactregistry.iam.gserviceaccount.com"
  ]
}