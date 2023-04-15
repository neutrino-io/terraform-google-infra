resource "google_artifact_registry_repository" "general_repo" {
  location      = var.region
  repository_id = var.org_id
  description   = "${var.org_id} repository"
  format        = "DOCKER"
  kms_key_name  = google_kms_crypto_key.kubernetes-secrets.name

  depends_on = [
    google_project_service.gke_service
  ]
}