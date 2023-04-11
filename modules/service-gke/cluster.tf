module "clusters" {
  source                     = "terraform-google-modules/kubernetes-engine/google//modules/private-cluster"
  project_id                 = var.project_id
  name                       = "${var.org_id}-cluster-core-${var.env}"
  region                     = var.region
  zones                      = ["${var.region}-a", "${var.region}-b"]
  network                    = var.vpc.name
  subnetwork                 = google_compute_subnetwork.cluster_core_subnet.name
  ip_range_pods              = "services-range"
  ip_range_services          = "pods-range"
  http_load_balancing        = false
  network_policy             = false
  horizontal_pod_autoscaling = true
  filestore_csi_driver       = false
  remove_default_node_pool   = true
  identity_namespace         = "${var.project_id}.svc.id.goog"
  node_metadata              = "GKE_METADATA"
  enable_private_endpoint    = false
  enable_private_nodes       = true
  master_ipv4_cidr_block     = var.k8s_master_ipv4_cidr
  add_master_webhook_firewall_rules = true
  database_encryption = [{
    state    = "ENCRYPTED"
    key_name = google_kms_crypto_key.kubernetes-secrets.id
  }]

  master_authorized_networks = [
    {
      cidr_block   = "0.0.0.0/0"
      display_name = "VPC"
    },
  ]

  firewall_inbound_ports = [
    "8443",
    "9443",
    "4000"
  ]

  node_pools = [
    {
      name               = "control-pool"
      machine_type       = "e2-medium"
      node_locations     = "${var.region}-a,${var.region}-b"
      min_count          = 1
      max_count          = 10
      local_ssd_count    = 0
      spot               = true
      disk_size_gb       = 30
      disk_type          = "pd-standard"
      image_type         = "COS_CONTAINERD"
      enable_gcfs        = false
      enable_gvnic       = false
      auto_repair        = true
      auto_upgrade       = true
      service_account    = google_service_account.cluster_core.email
      preemptible        = false
      initial_node_count = 1
    },
  ]

  node_pools_oauth_scopes = {
    all = [
      "https://www.googleapis.com/auth/cloud-platform",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }

  node_pools_metadata = {
    all = {
      google-compute-enable-virtio-rng = "true",
      disable-legacy-endpoints         = "true"
    }
  }
}


data "google_container_cluster" "gke_cluster" {
  name     = module.clusters.name
  location = module.clusters.location
  project = var.project_id
}