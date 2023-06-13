resource "kubectl_manifest" "cluster_issuer" {
  yaml_body = <<-EOF
    apiVersion: cert-manager.io/v1
    kind: ClusterIssuer
    metadata:
      name: dns-clusterissuer
    spec:
      acme:
        email: ${var.support_email}
        server: https://acme-staging-v02.api.letsencrypt.org/directory
        privateKeySecretRef:
          name: dns-clusterissuer-account-key
        solvers:
        - dns01:
            cloudDNS:
              project: ${var.project_id}

  EOF

}
