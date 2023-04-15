variable "org_id" {
  description = "Organisation name"
  type        = string
}

variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "region" {
  description = "GCP project region"
  type        = string
}

variable "env" {
  description = "Project environment"
  type        = string
}

variable "gke_services" {
  type = list(string)
  default = [
    "container.googleapis.com",
    "artifactregistry.googleapis.com",
    "cloudbuild.googleapis.com"
  ]
  description = "List of services to enable for GKE service"
}

variable "service_account_iam_roles" {
  type = list(string)
  default = [
    "roles/logging.logWriter",
    "roles/monitoring.metricWriter",
    "roles/monitoring.viewer",
    "roles/storage.objectViewer",
    "roles/stackdriver.resourceMetadata.writer",
    "roles/artifactregistry.reader"
  ]
  description = "List of IAM roles to assign to the service account."
}

# Networking
# ------------------------------

variable "vpc" {
  description = "Cluster VPC"
  type        = any
}

variable "cluster_core_cidr" {
  description = "Cluster core CIDR"
  type        = string
  default     = "10.1.0.0/16"
}

#variable "authorized_source_ranges" {
#  type        = list(string)
#  default     = ["0.0.0.0/0"]
#  description = "Addresses or CIDR blocks which are allowed to connect to GKE API Server."
#}

# Kubernetes options
# ------------------------------

#variable "k8s_instance_type" {
#  type    = string
#  default = "e2-standard-2"
#}

#variable "k8s_nodes_per_zone" {
#  type        = number
#  default     = 1
#  description = "Number of nodes to deploy in each zone of the Kubernetes cluster. For example, if there are 4 zones in the region and num_nodes_per_zone is 2, 8 total nodes will be created."
#}

#variable "k8s_num_nodes" {
#  type        = number
#  default     = 2
#  description = "number of gke nodes"
#}

#variable "k8s_username" {
#  type        = string
#  default     = "cluster-admin"
#  description = "gke username"
#}

#variable "k8s_password" {
#  type        = string
#  default     = ""
#  description = "gke password"
#}

variable "k8s_master_ipv4_cidr" {
  type        = string
  default     = "10.0.82.0/28"
  description = "The IP range in CIDR notation to use for the hosted master network. This range will be used for assigning internal IP addresses to the master or set of masters, as well as the ILB VIP. This range must not overlap with any other ranges in use within the cluster's network."
}

variable "k8s_pod_ipv4_cidr" {
  type        = string
  default     = "10.4.0.0/16"
  description = "The IP address range of the container pods in this cluster, in CIDR notation"
}

variable "k8s_service_ipv4_cidr" {
  type        = string
  default     = "10.8.0.0/16"
  description = "The IP address range of the Kubernetes services in this cluster, in CIDR notation"
}

# KMS options
# ------------------------------

variable "k8s_secrets_crypto_key" {
  type        = string
  default     = "kubernetes-secrets"
  description = "Name of the KMS key to use for encrypting the Kubernetes database."
}

variable "kms_key_ring_common" {
  description = "Common key ring"
  type        = any
}
