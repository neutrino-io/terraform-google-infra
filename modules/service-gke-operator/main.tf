// Operator Strimzi
module "operator-strimzi" {
  count = var.enable_operator_strimzi ? 1 : 0

  source = "./operator-strimzi"
  app_org_id = var.app_org_id
}

// Operator traefik
module "operator-traefik" {
  count = var.enable_operator_traefik ? 1 : 0

  source = "./operator-traefik"
  app_org_id = var.app_org_id
}

// Operator Rook
 module "operator-rook" {
   count = var.enable_operator_rook ? 1 : 0

   source = "./operator-rook"
   app_org_id = var.app_org_id
 }

// Operator Flink
 module "operator-flink" {
   count = var.enable_operator_flink ? 1 : 0

   source = "./operator-flink"
   app_org_id = var.app_org_id
 }
