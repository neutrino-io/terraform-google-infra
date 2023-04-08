# GCP project data
data "google_project" "project" {
  project_id = var.project_id
}