terraform {
  required_version = "1.4.6"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.61"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.1"
    }
  }
}
