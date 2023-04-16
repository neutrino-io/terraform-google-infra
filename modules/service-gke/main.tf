# GCP project data
data "google_project" "project" {
  project_id = var.project_id
}

locals {
  cluster_control_key  = "control"
  cluster_control_name = "${var.org_id}-${local.cluster_control_key}-${var.env}"
  kms_key_name         = var.env == "production" ? google_kms_crypto_key.kubernetes-secrets-prod[0].id : google_kms_crypto_key.kubernetes-secrets-develop[0].id
}