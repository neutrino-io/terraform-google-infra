variable "app_org_id" {
  description = "Application organization ID"
}

variable "google_access_token" {
  description = "Google access token"
}

variable "gke_endpoint" {
  description = "GKE endpoint"
}

variable "gke_cluster_ca" {
  description = "GKE cluster CA"
}

variable "gke_master_auth" {
  description = "GKE master auth"
}

# Operator Flink
variable "enable_operator_flink" {
  description = "Enable operator flink"
  default     = false
}

# Operator Rook
variable "enable_operator_rook" {
  description = "Enable operator rook"
  default     = false
}

# Operator Strimzi
variable "enable_operator_strimzi" {
  description = "Enable operator strimzi"
  default     = false
}

# Operator Traefik
variable "enable_operator_traefik" {
  description = "Enable operator traefik"
  default     = false
}