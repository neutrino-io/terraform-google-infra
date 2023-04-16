# Create KMS crypto key for Kubernetes secrets
resource "google_kms_crypto_key" "kubernetes-secrets-develop" {
  #bridgecrew:skip=CKV_GCP_82: This is a development key
  count           = var.env != "production" ? 1 : 0
  name            = var.k8s_secrets_crypto_key
  key_ring        = var.kms_key_ring_common.id
  rotation_period = "604800s"
}

resource "google_kms_crypto_key" "kubernetes-secrets-prod" {
  count = var.env == "production" ? 1 : 0

  name            = var.k8s_secrets_crypto_key
  key_ring        = var.kms_key_ring_common.id
  rotation_period = "604800s"

  lifecycle {
    prevent_destroy = true
  }
}