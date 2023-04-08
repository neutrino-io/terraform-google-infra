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
  zone_default        = var.zone_default
  vpc                 = module.service_common.vpc
  kms_key_ring_common = module.service_common.kms_key_ring_common

  depends_on = [
    module.service_common
  ]
}

module "service_gke_operator" {
  count = var.enable_service_gke_operator ? 1 : 0

  source     = "./modules/service-gke-operator"
  app_org_id = var.app_org_id
  google_access_token = data.google_client_config.current.access_token
  gke_endpoint = module.service_gke[0].endpoint
  gke_cluster_ca = module.service_gke[0].ca_certificate
  gke_master_auth = module.service_gke[0].master_auth

  depends_on = [
    module.service_gke
  ]
}

module "service_firebase" {
  count = var.enable_service_firebase ? 1 : 0

  source     = "./modules/service-firebase"
  app_org_id = var.app_org_id
  env        = var.env
  project_id = var.project_id
  region     = var.region

  depends_on = [
    module.service_common
  ]
}