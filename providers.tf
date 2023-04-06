terraform {
  required_providers {
    kubectl = {
      source = "gavinbunney/kubectl"
      version = "1.13.0"
    }

    null = {
      version = "~> 3.1.0"
    }

    auth0 = {
      source  = "alexkappa/auth0"
      version = "0.26.2"
    }
  }
}

# GCP
provider "google" {
  alias = "impersonated"
  scopes = [
    "https://www.googleapis.com/auth/cloud-platform",
    "https://www.googleapis.com/auth/userinfo.email",
  ]
}

data "google_service_account_access_token" "default" {
  provider = google.impersonated
  # Below is the Service Account that we will impersonate
  target_service_account = "provisioner@${var.project_id}.iam.gserviceaccount.com"
  scopes = ["userinfo-email", "cloud-platform"]
  lifetime = "3600s"
}

provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone_default
  billing_project = var.project_id
  user_project_override = true
  access_token = data.google_service_account_access_token.default.access_token
}

provider "google-beta" {
  project = var.project_id
  region  = var.region
  zone    = var.zone_default
  billing_project = var.project_id
  access_token = data.google_service_account_access_token.default.access_token
}

data "google_client_config" "current" {
  provider = google.impersonated
}

provider "kubernetes" {
  host  = "https://${module.service_gke.endpoint}"
  token = data.google_client_config.current.access_token
  cluster_ca_certificate = base64decode(module.service_gke.ca_certificate)
}

provider "helm" {
  kubernetes {
    host                   = "https://${module.service_gke.endpoint}"
    token                  = data.google_client_config.current.access_token
    client_certificate     = base64decode(module.service_gke.master_auth.0.client_certificate)
    client_key             = base64decode(module.service_gke.master_auth.0.client_key)
    cluster_ca_certificate = base64decode(module.service_gke.master_auth.0.cluster_ca_certificate)
  }
}