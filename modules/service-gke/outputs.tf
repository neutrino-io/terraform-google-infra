data "google_container_cluster" "gke_cluster" {
  name     = module.cluster-control-private.name
  location = module.cluster-control-private.location
  project  = var.project_id
}

output "cluster_core_address" {
  value = google_compute_address.cluster-control-address
  description = "Cluster control address"
}

output "endpoint" {
  sensitive   = true
  description = "Cluster endpoint"
  value       = module.cluster-control-private.endpoint
}

output "ca_certificate" {
  sensitive   = true
  description = "Cluster ca certificate (base64 encoded)"
  value       = module.cluster-control-private.ca_certificate
}

output "master_auth" {
  sensitive   = true
  description = "Cluster master auth"
  value       = data.google_container_cluster.gke_cluster.master_auth
}

output "gke_service" {
  value = google_project_service.gke_service
  description = "GKE related services"
}
