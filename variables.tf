variable "app_org_id" {
  description = "Application organization ID"
}

variable "project_id" {
  description = "GCP project ID"
}

variable "region" {
  description = "GCP project region"
}

variable "zone_default" {
  description = "GCP project default zone"
}

variable "env" {
  description = "Project environment"
}

variable "app_domain" {
  description = "Application domain"
}

#
# OAuth
# ------------------------------

variable "client_id" {
  description = "GCP client ID"
}

variable "client_secret" {
  description = "GCP client secret"
}

variable "enable_service_gke" {
  description = "Enable GKE service"
  default     = false
}

variable "enable_service_gke_operator" {
  description = "Enable GKE Operator service"
  default     = false
}

variable "enable_service_firebase" {
  description = "Enable Firebase service"
  default     = false
}

variable "service_gke_operators" {
  description = "GKE Operators configurations"
  default = [
    {
      name    = "traefik"
      enabled = true
    }
  ]
}