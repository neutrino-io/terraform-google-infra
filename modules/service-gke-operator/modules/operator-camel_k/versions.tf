terraform {
  required_version = "1.4.6"

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
      version = "1.14.0"
    }
  }
}
