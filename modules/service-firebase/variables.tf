variable "project_id" {
    description = "GCP project ID"
}

variable "project_number" {
    description = "GCP project number"
}

variable "region" {
    description = "GCP project region"
}

variable "firebase_services" {
    type = list(string)
    default = [
        "firebase.googleapis.com",
        "firestore.googleapis.com",
    ]
    description = "List of services to enable for Firebase service"
}