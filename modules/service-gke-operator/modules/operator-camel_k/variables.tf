variable "app_org_id" {
  description = "Application organization ID"
  type        = string
}

variable "project_id" {
  description = "GCP project ID"
  type        = string
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

#variable "env" {
#  description = "Project environment"
#  type        = string
#}
#
#variable "firebase_app_id" {
#  description = "Firebase App ID"
#  type        = string
#}
