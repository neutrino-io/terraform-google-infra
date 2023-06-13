resource "google_dns_managed_zone" "sub_domain_env" {
  name        = "${var.env}-${replace(var.app_domain, ".", "-")}"
  dns_name    = "${var.env}.${var.app_domain}."
  description = "${var.app_org_id} zone - ${var.env}"

  dnssec_config {
    kind          = "dns#managedZoneDnsSecConfig"
    non_existence = "nsec3"
    state         = "on"
  }

  depends_on = [
    google_project_service.service
  ]
}

#resource "google_dns_record_set" "sub_domain_env_validation" {
#  name = google_dns_managed_zone.sub_domain_env.dns_name
#  type = "TXT"
#  ttl  = 300
#
#  managed_zone = google_dns_managed_zone.sub_domain_env.name
#
#  rrdatas = ["google-site-verification=3QNsNLSsxMoDGFfrcnF9MaPrzz48T_AAXPI_aSNTOKE"]
#}

output "managed_zone" {
  value = google_dns_managed_zone.sub_domain_env
}
