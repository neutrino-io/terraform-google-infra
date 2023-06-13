variable "app_org_id" {
  description = "Application organization ID"
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

variable "enable_registry_operator" {
  description = "Enable registry operator"
  type        = bool
  default     = false
}
