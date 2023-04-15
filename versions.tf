terraform {
  required_version = ">=0.13"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.61"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = ">= 4.61"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.9.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.19.0"
    }
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = "1.13.0"
    }
    null = {
      version = "~> 3.1.0"
    }
  }

  provider_meta "google" {
    module_name = "blueprints/terraform/exported-krm/v0.1.0"
  }
}
