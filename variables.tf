variable "app_org_id" {
  description = "Application organization ID"
  type        = string
}

variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "region" {
  description = "GCP project region"
  type        = string
}

variable "zone_default" {
  description = "GCP project default zone"
  type        = string
}

variable "env" {
  description = "Project environment"
  type        = string
}

variable "app_domain" {
  description = "Application domain"
  type        = string
}

#
# OAuth
# ------------------------------

variable "client_id" {
  description = "GCP client ID"
  type        = string
}

variable "client_secret" {
  description = "GCP client secret"
  type        = string
}

variable "enable_service_gke" {
  description = "Enable GKE service"
  default     = false
  type        = bool
}

variable "enable_service_gke_operator" {
  description = "Enable GKE Operator service"
  default     = false
  type        = bool
}

variable "enable_service_firebase" {
  description = "Enable Firebase service"
  default     = false
  type        = bool
}

variable "service_gke_operators" {
  description = "GKE Operators configurations"
  default = [
    {
      name    = "traefik"
      enabled = true
    }
  ]
  type = list(object({
    name      = string
    enabled   = bool
    version   = optional(string)
    namespace = optional(string)
    settings  = optional(map(string))
  }))
}