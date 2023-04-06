resource "google_artifact_registry_repository" "general_repo" {
  location      = var.region
  repository_id = var.org_id
  description   = "${var.org_id} repository"
  format        = "DOCKER"
}