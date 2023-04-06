# GKE cluster
# data "google_container_engine_versions" "asiasoutheast1b" {
#   provider       = google-beta
#   location       = var.zone_default
#   version_prefix = "1.24."
# }

# resource "google_container_cluster" "cluster_core" {
#   name               = "${var.org_id}-cluster-core-${var.env}"
#   location           = var.region
#   min_master_version = data.google_container_engine_versions.asiasoutheast1b.latest_node_version

#   # Disable legacy ACLs. The default is false, but explicitly marking it false
#   # here as well.
#   enable_legacy_abac = false

#   workload_identity_config {
#     workload_pool = "${var.project_id}.svc.id.goog"
#   }

#   remove_default_node_pool = true
#   initial_node_count       = 1

#   # Node config
#   node_config {
#     service_account = google_service_account.cluster_core.email
#     oauth_scopes = [
#       "https://www.googleapis.com/auth/cloud-platform"
#     ]
#   }

#   # cluster_autoscaling {
#   #   enabled = true
#   # }

#   database_encryption {
#     state    = "ENCRYPTED"
#     key_name = google_kms_crypto_key.kubernetes-secrets.id
#   }

#   network    = var.vpc.id
#   subnetwork = google_compute_subnetwork.cluster_core_subnet.id

#   private_cluster_config {
#     enable_private_endpoint = false
#     enable_private_nodes    = true
#     master_ipv4_cidr_block  = var.k8s_master_ipv4_cidr
#   }

#   master_authorized_networks_config {
#     dynamic "cidr_blocks" {
#       for_each = var.authorized_source_ranges
#       content {
#         cidr_block = cidr_blocks.value
#       }
#     }
#   }

#   ip_allocation_policy {
#     cluster_secondary_range_name  = "services-range"
#     services_secondary_range_name = "pods-range"
#   }

#   # Configure various addons
#   addons_config {
#     # Enable network policy configurations (like Calico).
#     network_policy_config {
#       disabled = false
#     }
#   }

#   # Disable basic authentication and cert-based authentication.
#   master_auth {
#     # username = ""
#     # password = ""

#     client_certificate_config {
#       issue_client_certificate = false
#     }
#   }

#   # Enable network policy configurations (like Calico) - for some reason this
#   # has to be in here twice.
#   network_policy {
#     enabled = true
#   }

#   maintenance_policy {
#     recurring_window {
#       start_time = "2021-06-18T00:00:00Z"
#       end_time   = "2050-01-01T04:00:00Z"
#       recurrence = "FREQ=WEEKLY"
#     }
#   }

#   release_channel {
#     channel = "REGULAR"
#   }

#   depends_on = [
#     var.gke_services,
#     google_service_account.cluster_core,
#     google_compute_address.cluster_core_address,
#     google_kms_crypto_key_iam_member.kubernetes-secrets-gke
#   ]
# }

# resource "google_container_node_pool" "pool_e2_s2" {
#   name     = "pool-e2-s2"
#   project  = var.project_id
#   cluster  = google_container_cluster.cluster_core.id
#   location = google_container_cluster.cluster_core.location

#   node_locations = [
#     "asia-southeast1-a",
#     "asia-southeast1-b"
#   ]

#   autoscaling {
#     min_node_count = var.k8s_nodes_per_zone
#     max_node_count = 6
#   }
#   initial_node_count = var.k8s_nodes_per_zone

#   node_config {
#     preemptible  = true
#     machine_type = var.k8s_instance_type
#     image_type   = "ubuntu_containerd"

#     disk_size_gb = 30

#     service_account = google_service_account.cluster_core.email
#     oauth_scopes = [
#       "https://www.googleapis.com/auth/cloud-platform"
#     ]

#     # Set metadata on the VM to supply more entropy
#     metadata = {
#       google-compute-enable-virtio-rng = "true"
#       disable-legacy-endpoints         = "true"
#     }

#     # Protect node metadata
#     workload_metadata_config {
#       mode = "GKE_METADATA"
#     }
#   }

#   timeouts {
#     create = "30m"
#     update = "20m"
#   }

#   depends_on = [
#     google_service_account.cluster_core,
#     google_container_cluster.cluster_core
#   ]
# }

# resource "google_container_node_pool" "pool_e2_s8" {
#   name     = "pool-e2-s8"
#   project  = var.project_id
#   cluster  = google_container_cluster.cluster_core.id
#   location = google_container_cluster.cluster_core.location

#   # node_count = var.k8s_nodes_per_zone

#   node_locations = [
#     "asia-southeast1-a",
#     "asia-southeast1-b"
#   ]

#   autoscaling {
#     min_node_count = var.k8s_nodes_per_zone
#     max_node_count = 3
#   }
#   initial_node_count = var.k8s_nodes_per_zone

#   node_config {
#     preemptible  = true
#     machine_type = "e2-standard-8"
#     image_type   = "ubuntu_containerd"

#     disk_size_gb = 30

#     service_account = google_service_account.cluster_core.email
#     oauth_scopes = [
#       "https://www.googleapis.com/auth/cloud-platform"
#     ]

#     # Set metadata on the VM to supply more entropy
#     metadata = {
#       google-compute-enable-virtio-rng = "true"
#       disable-legacy-endpoints         = "true"
#     }

#     # Protect node metadata
#     workload_metadata_config {
#       mode = "GKE_METADATA"
#     }
#   }

#   timeouts {
#     create = "30m"
#     update = "20m"
#   }

#   depends_on = [
#     google_service_account.cluster_core,
#     google_container_cluster.cluster_core
#   ]
# }