resource "google_identity_platform_default_supported_idp_config" "idp_config" {
  enabled       = true
  idp_id        = "google.com"
  client_id     = var.client_id
  client_secret = var.client_secret

  depends_on = [
    google_project_service.service
  ]
}
