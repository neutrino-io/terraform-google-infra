variable "app_org_id" {
  description = "Application organization ID"
}

variable "operator_version" {
  description = "Operator version"
  default     = ""
}

variable "operator_namespace" {
  description = "Operator namespace"
  default     = ""
}

variable "operator_settings" {
  description = "Operator settings"
  default     = {}
}