resource "google_compute_subnetwork" "cluster_core_subnet" {
  name          = format("%s", "${var.org_id}-${var.region}-cluster-core-${var.env}")
  network       = var.vpc.self_link
  region        = var.region
  ip_cidr_range = var.cluster_core_cidr

  secondary_ip_range {
    range_name    = "services-range"
    ip_cidr_range = var.k8s_service_ipv4_cidr
  }

  secondary_ip_range {
    range_name    = "pods-range"
    ip_cidr_range = var.k8s_pod_ipv4_cidr
  }

  private_ip_google_access = true
}

resource "google_compute_address" "cluster_core_address" {
  name   = format("%s", "${var.org_id}-cluster-core-nat-${var.env}")
  region = var.region

  depends_on = [var.service]
}

resource "google_compute_router" "cluster_core_router" {
  name    = format("%s", "${var.org_id}-cluster-core-router-${var.env}")
  network = var.vpc.id

  bgp {
    asn = 64514
  }
}

resource "google_compute_router_nat" "cluster_core_router_nat" {
  name                               = format("%s", "${var.org_id}-cluster-core-router-nat-${var.env}")
  router                             = google_compute_router.cluster_core_router.name
  nat_ip_allocate_option             = "MANUAL_ONLY"
  nat_ips                            = google_compute_address.cluster_core_address.*.self_link
  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"

  subnetwork {
    name                    = google_compute_subnetwork.cluster_core_subnet.id
    source_ip_ranges_to_nat = ["PRIMARY_IP_RANGE", "LIST_OF_SECONDARY_IP_RANGES"]

    secondary_ip_range_names = [
      google_compute_subnetwork.cluster_core_subnet.secondary_ip_range[0].range_name,
      google_compute_subnetwork.cluster_core_subnet.secondary_ip_range[1].range_name
    ]
  }

  depends_on = [google_compute_address.cluster_core_address]
}


output "cluster_core_address" {
  value = google_compute_address.cluster_core_address
}