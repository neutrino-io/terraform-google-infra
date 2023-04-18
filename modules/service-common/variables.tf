variable "app_org_id" {
  description = "Organisation name"
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

variable "env" {
  description = "GCP Project environment"
  type        = string
}

#
# DNS
# ------------------------------
variable "app_domain" {
  description = "Application domain"
  type        = string
}

#variable "enable_domain_service" {
#    description = "Enable subdomain for service"
#    type        = bool
#    default     = false
#}
#
#variable "enable_domain_app" {
#    description = "Enable subdomain for app"
#    type        = bool
#    default     = false
#}

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
    "appengine.googleapis.com",
    "container.googleapis.com",
  ]
  description = "List of services to enable on the project."
}

#
# VPC & Networking
# ------------------------------

variable "primary_private_cidr" {
  default     = "10.26.1.0/24"
  description = "Private subnet"
  type        = string
}

variable "primary_public_cidr" {
  default     = "10.26.2.0/24"
  description = "Public subnet"
  type        = string
}

#
# KMS
# ------------------------------

variable "kms_key_ring" {
  type        = string
  default     = ""
  description = "String value to use for the name of the KMS key ring. This exists for backwards-compatability for users of the existing configurations. Please use kms_key_ring_prefix instead."
}
