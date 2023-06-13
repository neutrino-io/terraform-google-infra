variable "app_org_id" {
  type        = string
  description = "Application organization ID"
}

variable "project_id" {
  type        = string
  description = "GCP project ID"
}

variable "region" {
  type        = string
  description = "GCP project region"
}

variable "zone_default" {
  type        = string
  description = "GCP project default zone"
}

variable "env" {
  type        = string
  description = "Project environment"
}

variable "app_domain" {
  type        = string
  description = "Application domain"
}

variable "client_id" {
  type        = string
  description = "GCP client ID"
}

variable "client_secret" {
  type        = string
  description = "GCP client secret"
}
