data "google_service_account" "sa-provisioner" {
  provider   = google-beta
  project    = var.project_id
  account_id = "provisioner"
}

# Google IAM Policy Binding for the Service Account with Workload Identity
resource "google_service_account_iam_member" "cbuilder-workloadidentity" {
  service_account_id = data.google_service_account.sa-provisioner.name
  member             = "serviceAccount:${var.project_id}.svc.id.goog[${local.operator_namespace}/camel-k-builder]"
  role               = "roles/iam.workloadIdentityUser"
}

resource "kubernetes_annotations" "sa-cbuilder" {
  api_version = "v1"
  kind        = "ServiceAccount"
  metadata {
    name      = "camel-k-builder"
    namespace = local.operator_namespace
  }
  annotations = {
    "iam.gke.io/gcp-service-account" = data.google_service_account.sa-provisioner.email
  }

  depends_on = [
    kubernetes_namespace.system-camel_k,
    helm_release.camel_k
  ]
}
