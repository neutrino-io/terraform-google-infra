module "google-infra" {
  source         = "../"
  app_org_id     = var.app_org_id
  project_id     = var.project_id
  project_number = var.project_number
  region         = var.region
  zone_default   = var.zone_default
  env            = var.env
  app_domain     = var.app_domain
  client_id      = var.client_id
  client_secret  = var.client_secret
}
