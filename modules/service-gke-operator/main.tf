// Operator Strimzi
module "operator-strimzi" {
  source = "./operator-strimzi"

  app_org_id = var.app_org_id
}

// Operator traefik
module "operator-traefik" {
  source = "./operator-traefik"

  app_org_id = var.app_org_id
}

// Operator Rook
 module "operator-rook" {
   source = "./operator-rook"

   app_org_id = var.app_org_id
 }

// Operator Flink
 module "operator-flink" {
   source = "./operator-flink"

   app_org_id = var.app_org_id
 }
