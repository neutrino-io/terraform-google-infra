resource "google_kms_crypto_key" "kubernetes-secrets" {
  name            = var.k8s_secrets_crypto_key
  key_ring        = var.kms_key_ring_common.id
  rotation_period = "604800s"

  lifecycle {
    prevent_destroy = true
  }
}

# Grant GKE access to the key
resource "google_kms_crypto_key_iam_member" "kubernetes-secrets-gke" {
  crypto_key_id = google_kms_crypto_key.kubernetes-secrets.id
  role          = "roles/cloudkms.cryptoKeyEncrypterDecrypter"
  member        = "serviceAccount:service-${data.google_project.project.number}@container-engine-robot.iam.gserviceaccount.com"
}