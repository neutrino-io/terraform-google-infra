variable "app_org_id" {
  description = "Application organization ID"
  type        = string
}

variable "project_id" {
  description = "GCP project ID"
  type        = string
  default     = ""
}

variable "operator_version" {
  description = "Operator version"
  type        = string
  default     = ""
}

variable "operator_namespace" {
  description = "Operator namespace"
  type        = string
  default     = ""
}

variable "operator_settings" {
  description = "Operator settings"
  type        = map(string)
  default     = {}
}

variable "support_email" {
  description = "Email Support"
  type        = string
  default     = ""
}

variable "sa_iam_roles_dnsadmin" {
  type = list(string)
  default = [
    "roles/dns.admin"
  ]
  description = "List of IAM roles to assign to the DNS admin service account."
}