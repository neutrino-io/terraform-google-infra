module "service_common" {
  source        = "./modules/service-common"
  env           = var.env
  app_org_id    = var.app_org_id
  project_id    = var.project_id
  region        = var.region
  app_domain    = var.app_domain
  client_id     = var.client_id
  client_secret = var.client_secret
}

module "service_gke" {
  count = var.enable_service_gke ? 1 : 0

  source              = "./modules/service-gke"
  env                 = var.env
  org_id              = var.app_org_id
  project_id          = var.project_id
  region              = var.region
  vpc                 = module.service_common.vpc
  kms_key_ring_common = module.service_common.kms_key_ring_common

  depends_on = [
    module.service_common
  ]
}

module "service_gke_operator" {
  count = var.enable_service_gke && var.enable_service_gke_operator ? 1 : 0

  source        = "./modules/service-gke-operator"
  app_org_id    = var.app_org_id
  gke_operators = var.service_gke_operators

  depends_on = [
    module.service_gke
  ]
}

module "service_firebase" {
  count = var.enable_service_firebase ? 1 : 0

  source     = "./modules/service-firebase"
  app_org_id = var.app_org_id
  app_domain = var.app_domain
  env        = var.env
  project_id = var.project_id
  region     = var.region

  depends_on = [
    module.service_common
  ]
}