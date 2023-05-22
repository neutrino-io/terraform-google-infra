# Create DNS solver service account
resource "google_service_account" "dns_admin" {
  account_id   = "dns-admin"
  display_name = "DNS admin"
  project      = var.project_id
}

# Add the service account to the project
resource "google_project_iam_binding" "dns_admin_binding" {
  project = var.project_id
  count   = length(var.sa_iam_roles_dnsadmin)
  role    = element(var.sa_iam_roles_dnsadmin, count.index)
  members  = [
    "serviceAccount:${google_service_account.dns_admin.email}"
  ]

  depends_on = [
    google_service_account.dns_admin
  ]
}

resource "google_service_account_iam_binding" "dns_admin_workload_identity" {
  service_account_id = google_service_account.dns_admin.name
  role = "roles/iam.workloadIdentityUser"
  members = [
    "serviceAccount:${var.project_id}.svc.id.goog[system-certmanager/cert-manager]"
  ]

  depends_on = [
    google_service_account.dns_admin
  ]
}