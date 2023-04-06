variable "app_org_id" {
  description = "Organisation name"
}

variable "project_id" {
  description = "GCP project ID"
}

variable "project_number" {
  description = "GCP project number"
}

variable "region" {
  description = "GCP project region"
}

variable "env" {
  description = "GCP Project environment"
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

#
# API Services
# ------------------------------

variable "project_services" {
  type = list(string)
  default = [
    "identitytoolkit.googleapis.com",
    "cloudkms.googleapis.com",
    "servicenetworking.googleapis.com",
    "compute.googleapis.com",
    "logging.googleapis.com",
    "monitoring.googleapis.com",
    "dns.googleapis.com",
    "container.googleapis.com",
    "appengine.googleapis.com"
  ]
  description = "List of services to enable on the project."
}


#
# VPC & Networking
# ------------------------------

variable "primary_private_cidr" {
  default     = "10.26.1.0/24"
  description = "Private subnet"
}

variable "primary_public_cidr" {
  default     = "10.26.2.0/24"
  description = "Public subnet"
}

#
# KMS
# ------------------------------

variable "kms_key_ring" {
  type        = string
  default     = ""
  description = "String value to use for the name of the KMS key ring. This exists for backwards-compatability for users of the existing configurations. Please use kms_key_ring_prefix instead."
}