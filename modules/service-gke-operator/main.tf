// Operator Traefik
locals {
  operator_traefik         = [for operator in var.gke_operators : operator if operator.name == "traefik"]
  operator_traefik_enabled = length(local.operator_traefik) > 0 ? local.operator_traefik[0]["enabled"] : false
}
module "operator-traefik" {
  count = local.operator_traefik_enabled ? 1 : 0

  source             = "./operator-traefik"
  app_org_id         = var.app_org_id
  operator_version   = local.operator_traefik[0]["version"]
  operator_namespace = local.operator_traefik[0]["namespace"]
  operator_settings  = local.operator_traefik[0]["settings"]
}


// Operator Strimzi
locals {
  operator_strimzi         = [for operator in var.gke_operators : operator if operator.name == "strimzi"]
  operator_strimzi_enabled = length(local.operator_strimzi) > 0 ? local.operator_strimzi[0]["enabled"] : false
}
module "operator-strimzi" {
  count = local.operator_strimzi_enabled ? 1 : 0

  source             = "./operator-strimzi"
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

  source             = "./operator-cloudnativepg"
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

  source             = "./operator-rook"
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

  source             = "./operator-flink"
  app_org_id         = var.app_org_id
  operator_version   = local.operator_flink[0]["version"]
  operator_namespace = local.operator_flink[0]["namespace"]
  operator_settings  = local.operator_flink[0]["settings"]
}
