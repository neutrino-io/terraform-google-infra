resource "google_compute_network" "vpc" {
  name                    = format("%s", "${var.app_org_id}-vpc-${var.env}")
  auto_create_subnetworks = "false"
  routing_mode            = "GLOBAL"

  depends_on = [google_project_service.service]
}

output "vpc" {
  value = google_compute_network.vpc
}
