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

variable "gke_operators" {
  description = "Enable operators and its setting"
  type        = list(object({
    name      = string
    enabled   = bool
    version   = optional(string)
    namespace = optional(string)
    settings  = optional(map(string))
  }))

  default = [
    {
      name      = "traefik"
      enabled   = true
    }
  ]
}