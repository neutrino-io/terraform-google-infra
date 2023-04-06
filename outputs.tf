output "vpc" {
  value = module.service_common.vpc
}

output "service" {
  value = module.service_common.service
}

output "kms_key_ring_common" {
  value = module.service_common.kms_key_ring_common
}