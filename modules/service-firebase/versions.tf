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
    local = {
      source  = "hashicorp/local"
      version = ">= 2.1"
    }
  }
}
