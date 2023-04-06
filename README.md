[![GitHub tag (latest SemVer)](https://img.shields.io/github/tag/neutrino-io/terraform-google-infra.svg?label=latest)](https://github.com/neutrino-io/terraform-google-infra/releases/latest)
![Terraform Version](https://img.shields.io/badge/tf-%3E%3D1.0.x-blue.svg)

# Neutrino Platform Builder - GCP Infrastructure

## Pre Requisite

- Complete setup of Google Foundation module

### Post Installation

- Manually add 8443 port rule in `gke-<project>-cluster-core-<env>-<sha>-master` [1]
- Manually add NS record of subdomain to parent domain
- Run kubectl create clusterrolebinding deployment-controller --clusterrole=cluster-admin --serviceaccount=kube-system:deployment-controller
- Run kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | grep deployment-controller | awk '{print $1}')

### References
[1] https://stackoverflow.com/questions/70585521/clean-ambassador-edge-stack-install-on-gke-fails-with-dns-resolving