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

variable "client_id" {
  description = "GCP client ID"
  type        = string
}

variable "client_secret" {
  description = "GCP client secret"
  type        = string
}
