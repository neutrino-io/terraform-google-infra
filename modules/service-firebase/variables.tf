variable "app_org_id" {
  description = "Organisation name"
  type        = string
}

variable "app_domain" {
  description = "Domain name"
  type        = string
}

variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "env" {
  description = "GCP Project environment"
  type        = string
}

variable "region" {
  description = "GCP project region"
  type        = string
}

variable "firebase_services" {
  type = list(string)
  default = [
    "firebase.googleapis.com",
    "firestore.googleapis.com",
  ]
  description = "List of services to enable for Firebase service"
}
