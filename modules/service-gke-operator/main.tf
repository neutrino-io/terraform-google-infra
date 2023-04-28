// Default current project
data "google_client_config" "default" {}

locals {
  current_project = var.project_id != "" ? var.project_id : data.google_client_config.default.project
}


// Operator Traefik
locals {
  operator_traefik         = [for operator in var.gke_operators : operator if operator.name == "traefik"]
  operator_traefik_enabled = length(local.operator_traefik) > 0 ? local.operator_traefik[0]["enabled"] : false
}
module "operator-traefik" {
  count = local.operator_traefik_enabled ? 1 : 0

  source             = "./modules/operator-traefik"
  app_org_id         = var.app_org_id
  operator_version   = local.operator_traefik[0]["version"]
  operator_namespace = local.operator_traefik[0]["namespace"]
  operator_settings  = local.operator_traefik[0]["settings"]
}

// Operator Contour
locals {
  operator_contour         = [for operator in var.gke_operators : operator if operator.name == "contour"]
  operator_contour_enabled = length(local.operator_contour) > 0 ? local.operator_contour[0]["enabled"] : false
}
module "operator-contour" {
  count = local.operator_contour_enabled ? 1 : 0

  source             = "./modules/operator-contour"
  app_org_id         = var.app_org_id
  operator_version   = local.operator_contour[0]["version"]
  operator_namespace = local.operator_contour[0]["namespace"]
  operator_settings  = local.operator_contour[0]["settings"]
}

// Operator Strimzi
locals {
  operator_strimzi         = [for operator in var.gke_operators : operator if operator.name == "strimzi"]
  operator_strimzi_enabled = length(local.operator_strimzi) > 0 ? local.operator_strimzi[0]["enabled"] : false
}
module "operator-strimzi" {
  count = local.operator_strimzi_enabled ? 1 : 0

  source             = "./modules/operator-strimzi"
  app_org_id         = var.app_org_id
  operator_version   = local.operator_strimzi[0]["version"]
  operator_namespace = local.operator_strimzi[0]["namespace"]
  operator_settings  = local.operator_strimzi[0]["settings"]
}

// Operator CloudNativePG
locals {
  operator_cloudnativepg         = [for operator in var.gke_operators : operator if operator.name == "cloudnativepg"]
  operator_cloudnativepg_enabled = length(local.operator_cloudnativepg) > 0 ? local.operator_cloudnativepg[0]["enabled"] : false
}
module "operator-cloudnativepg" {
  count = local.operator_cloudnativepg_enabled ? 1 : 0

  source             = "./modules/operator-cloudnativepg"
  app_org_id         = var.app_org_id
  operator_version   = local.operator_cloudnativepg[0]["version"]
  operator_namespace = local.operator_cloudnativepg[0]["namespace"]
  operator_settings  = local.operator_cloudnativepg[0]["settings"]
}

// Operator Rook
locals {
  operator_rook         = [for operator in var.gke_operators : operator if operator.name == "rook"]
  operator_rook_enabled = length(local.operator_rook) > 0 ? local.operator_rook[0]["enabled"] : false
}
module "operator-rook" {
  count = local.operator_rook_enabled ? 1 : 0

  source             = "./modules/operator-rook"
  app_org_id         = var.app_org_id
  operator_version   = local.operator_rook[0]["version"]
  operator_namespace = local.operator_rook[0]["namespace"]
  operator_settings  = local.operator_rook[0]["settings"]
}


// Operator Flink
locals {
  operator_flink         = [for operator in var.gke_operators : operator if operator.name == "flink"]
  operator_flink_enabled = length(local.operator_flink) > 0 ? local.operator_flink[0]["enabled"] : false
}
module "operator-flink" {
  count = local.operator_flink_enabled ? 1 : 0

  source             = "./modules/operator-flink"
  app_org_id         = var.app_org_id
  operator_version   = local.operator_flink[0]["version"]
  operator_namespace = local.operator_flink[0]["namespace"]
  operator_settings  = local.operator_flink[0]["settings"]
}

// Operator Dapr
locals {
  operator_dapr         = [for operator in var.gke_operators : operator if operator.name == "dapr"]
  operator_dapr_enabled = length(local.operator_dapr) > 0 ? local.operator_dapr[0]["enabled"] : false
}
module "operator-dapr" {
  count = local.operator_dapr_enabled ? 1 : 0

  source             = "./modules/operator-dapr"
  app_org_id         = var.app_org_id
  operator_version   = local.operator_dapr[0]["version"]
  operator_namespace = local.operator_dapr[0]["namespace"]
  operator_settings  = local.operator_dapr[0]["settings"]
}

// Operator Prometheus
locals {
  operator_prometheus         = [for operator in var.gke_operators : operator if operator.name == "prometheus"]
  operator_prometheus_enabled = length(local.operator_prometheus) > 0 ? local.operator_prometheus[0]["enabled"] : false
}
module "operator-prometheus" {
  count = local.operator_prometheus_enabled ? 1 : 0

  source             = "./modules/operator-prometheus"
  app_org_id         = var.app_org_id
  operator_version   = local.operator_prometheus[0]["version"]
  operator_namespace = local.operator_prometheus[0]["namespace"]
  operator_settings  = local.operator_prometheus[0]["settings"]
}

// Operator OpenFunction
locals {
  operator_openfunction         = [for operator in var.gke_operators : operator if operator.name == "openfunction"]
  operator_openfunction_enabled = length(local.operator_openfunction) > 0 ? local.operator_openfunction[0]["enabled"] : false
}

module "operator-openfunction" {
  count = local.operator_openfunction_enabled ? 1 : 0

  source             = "./modules/operator-openfunction"
  app_org_id         = var.app_org_id
  operator_version   = local.operator_openfunction[0]["version"]
  operator_namespace = local.operator_openfunction[0]["namespace"]
  operator_settings  = local.operator_openfunction[0]["settings"]
}

// Operator Camel-K
locals {
  operator_camel-k         = [for operator in var.gke_operators : operator if operator.name == "camel-k"]
  operator_camel-k_enabled = length(local.operator_camel-k) > 0 ? local.operator_camel-k[0]["enabled"] : false
}

module "operator-camel_k" {
  count = local.operator_camel-k_enabled ? 1 : 0

  source             = "./modules/operator-camel_k"
  project_id         = local.current_project
  app_org_id         = var.app_org_id
  operator_version   = local.operator_camel-k[0]["version"]
  operator_namespace = local.operator_camel-k[0]["namespace"]
  operator_settings  = local.operator_camel-k[0]["settings"]
}