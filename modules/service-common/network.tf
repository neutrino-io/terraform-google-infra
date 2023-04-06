resource "google_compute_subnetwork" "primary_subnet_private" {
  name          = format("%s", "${var.app_org_id}-${var.region}-private-net-${var.env}")
  network       = google_compute_network.vpc.self_link
  region        = var.region
  ip_cidr_range = var.primary_private_cidr

  private_ip_google_access = true
}

resource "google_compute_subnetwork" "primary_subnet_public" {
  name          = format("%s", "${var.app_org_id}-${var.region}-public-net-${var.env}")
  network       = google_compute_network.vpc.self_link
  region        = var.region
  ip_cidr_range = var.primary_public_cidr
}

resource "google_compute_address" "primary_address" {
  name   = format("%s", "${var.app_org_id}-nat-${var.env}")
  region = var.region

  depends_on = [google_project_service.service]
}

resource "google_compute_router" "primary_router" {
  name    = format("%s", "${var.app_org_id}-router-${var.env}")
  network = google_compute_network.vpc.id

  bgp {
    asn = 64514
  }
}

resource "google_compute_router_nat" "primary-router-nat" {
  name                               = format("%s", "${var.app_org_id}-router-nat-${var.env}")
  router                             = google_compute_router.primary_router.name
  nat_ip_allocate_option             = "MANUAL_ONLY"
  nat_ips                            = google_compute_address.primary_address.*.self_link
  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"

  subnetwork {
    name                    = google_compute_subnetwork.primary_subnet_private.id
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }

  depends_on = [google_compute_address.primary_address]
}

output "primary_subnet_private" {
  value = google_compute_subnetwork.primary_subnet_private
}

output "primary_subnet_public" {
  value = google_compute_subnetwork.primary_subnet_public
}