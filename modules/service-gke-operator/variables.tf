variable "app_org_id" {
  type        = string
  description = "Application organization ID"
}

variable "gke_operators" {
  description = "Enable operators and their settings"
  type = list(object({
    name      = string
    enabled   = bool
    version   = optional(string)
    namespace = optional(string)
    settings  = optional(map(string))
  }))

  default = [
    {
      name    = "traefik"
      enabled = true
    }
  ]
}
