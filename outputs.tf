output "vpc" {
  value       = module.service_common.vpc
  description = "Project VPC"
}

output "service" {
  value       = module.service_common.service
  description = "Project Services"
}

output "kms_key_ring_common" {
  value       = module.service_common.kms_key_ring_common
  description = "KMS Key Ring Common"
}
