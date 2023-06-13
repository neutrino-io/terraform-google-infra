resource "google_artifact_registry_repository" "general_repo" {
  provider = google-beta

  location      = var.region
  repository_id = var.org_id
  description   = "${var.org_id} repository"
  format        = "docker"
  kms_key_name  = local.kms_key_name

  depends_on = [
    google_project_service.gke_service
  ]
}
