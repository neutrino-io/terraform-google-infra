module "cluster-control-private" {
  source  = "terraform-google-modules/kubernetes-engine/google//modules/private-cluster"
  version = "~> 25.0"

  project_id                        = var.project_id
  name                              = local.cluster_control_name
  region                            = var.region
  zones                             = ["${var.region}-a", "${var.region}-b"]
  network                           = var.vpc.name
  subnetwork                        = google_compute_subnetwork.cluster-control.name
  ip_range_pods                     = "services-range"
  ip_range_services                 = "pods-range"
  http_load_balancing               = false
  network_policy                    = false
  horizontal_pod_autoscaling        = true
  filestore_csi_driver              = false
  remove_default_node_pool          = true
  identity_namespace                = "${var.project_id}.svc.id.goog"
  node_metadata                     = "GKE_METADATA"
  enable_private_endpoint           = false
  enable_private_nodes              = true
  master_ipv4_cidr_block            = var.k8s_master_ipv4_cidr
  add_master_webhook_firewall_rules = true
  database_encryption = [{
    state    = "ENCRYPTED"
    key_name = local.kms_key_name
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
      name               = "${local.cluster_control_key}-pool-${var.region}"
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
      service_account    = google_service_account.cluster-control.email
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

  depends_on = [
    google_kms_crypto_key_iam_binding.kubernetes-secrets
  ]
}
