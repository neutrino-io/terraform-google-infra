# Enable required services on the project
resource "google_project_service" "gke_service" {
  count   = length(var.gke_services)
  project = var.project_id
  service = element(var.gke_services, count.index)

  # Do not disable the service on destroy. On destroy, we are going to
  # destroy the project, but we need the APIs available to destroy the
  # underlying resources.
  disable_on_destroy = false
  disable_dependent_services = true
}

output "gke_service" {
  value = google_project_service.gke_service
}