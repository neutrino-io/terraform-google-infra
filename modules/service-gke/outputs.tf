output "endpoint" {
  sensitive   = true
  description = "Cluster endpoint"
  value       = module.clusters.endpoint
}

output "ca_certificate" {
  sensitive   = true
  description = "Cluster ca certificate (base64 encoded)"
  value       = module.clusters.ca_certificate
}

output "master_auth" {
  sensitive   = true
  description = "Cluster master auth"
  value       = data.google_container_cluster.gke_cluster.master_auth
}