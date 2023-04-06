module "service_common" {
  source         = "./modules/service-common"
  env            = var.env
  app_org_id     = var.app_org_id
  project_id     = var.project_id
  project_number = var.project_number
  region         = var.region
  app_domain     = var.app_domain
  client_id      = var.client_id
  client_secret  = var.client_secret
}

module "service_gke" {
  source              = "./modules/service-gke"
  env                 = var.env
  org_id              = var.app_org_id
  project_id          = var.project_id
  project_number      = var.project_number
  region              = var.region
  zone_default        = var.zone_default
  vpc                 = module.service_common.vpc
  service             = module.service_common.service
  kms_key_ring_common = module.service_common.kms_key_ring_common

  depends_on = [
    module.service_common
  ]
}

module "service_gke_operator" {
  source           = "./modules/service-gke-operator"

  app_org_id = var.app_org_id

  depends_on = [
    module.service_gke
  ]
}