resource "google_compute_firewall" "allow-internal" {
  name    = "${var.app_org_id}-fw-allow-internal"
  network = google_compute_network.vpc.name
  allow {
    protocol = "icmp"
  }
  allow {
    protocol = "tcp"
    ports    = ["0-65535"]
  }
  allow {
    protocol = "udp"
    ports    = ["0-65535"]
  }
  source_ranges = [
    var.primary_public_cidr,
    var.primary_private_cidr
  ]
}

resource "google_compute_firewall" "allow-http" {
  name    = "${var.app_org_id}-fw-allow-http"
  network = google_compute_network.vpc.name
  allow {
    protocol = "tcp"
    ports    = ["80", "8080"]
  }
  target_tags   = ["http"]
  source_ranges = ["0.0.0.0"]
}

resource "google_compute_firewall" "allow-https" {
  name    = "${var.app_org_id}-fw-allow-https"
  network = google_compute_network.vpc.name
  allow {
    protocol = "tcp"
    ports    = ["443", "8443"]
  }
  target_tags   = ["https"]
  source_ranges = ["0.0.0.0"]
}
