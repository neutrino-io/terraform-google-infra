[![GitHub tag (latest SemVer)](https://img.shields.io/github/tag/neutrino-io/terraform-google-infra.svg?label=latest)](https://github.com/neutrino-io/terraform-google-infra/releases/latest)
![Terraform Version](https://img.shields.io/badge/tf-%3E%3D1.0.x-blue.svg)

# Neutrino Platform Builder - GCP Infrastructure

## Pre Requisite

- Complete setup of Google Foundation module
- Running post foundation setup script `PROJECT_ID=neutrino-develop-g1-f1f1f ACCOUNT_EMAIL=support@neutrino.sh IAP_SUPPORT_EMAIL=gcp-devops@neutrino.sh ./foundation-post.sh`
- Manually enable the Identity Platform API in the GCP console at https://console.cloud.google.com/customer-identity

### Post Installation

- Manually add 8443 port rule in `gke-<project>-cluster-core-<env>-<sha>-master` [1]
- Manually add NS record of subdomain to parent domain
- Run kubectl create clusterrolebinding deployment-controller --clusterrole=cluster-admin --serviceaccount=kube-system:deployment-controller
- Run kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | grep deployment-controller | awk '{print $1}')

## What's a Module?

A Module is a canonical, reusable, best-practices definition for how to run a single piece of infrastructure, such
as a database or server cluster. Each Module is written using a combination of [Terraform](https://www.terraform.io/)
and scripts (mostly bash) and include automated tests, documentation, and examples. It is maintained both by the open
source community and companies that provide commercial support.

Instead of figuring out the details of how to run a piece of infrastructure from scratch, you can reuse
existing code that has been proven in production. And instead of maintaining all that infrastructure code yourself,
you can leverage the work of the Module community to pick up infrastructure improvements through
a version number bump.

## Who maintains this Module?

This Module and its Submodules are maintained by [Nematix](https://nematix.com/). If you are looking for help or
commercial support, send an email to
[support@nematix.com](mailto:support@nematix.com?Subject=Terraform%20Modules).

Nematix can help with:

- Setup, customization, and support for this Module.
- Modules and submodules for other types of infrastructure, such as VPCs, Docker clusters, databases, and continuous
  integration.
- Consulting & Training on AWS, Terraform, and DevOps.


## How is this Module versioned?

This Module follows the principles of [Semantic Versioning](http://semver.org/).

During initial development, the major version will be 0 (e.g., `0.x.y`), which indicates the code does not yet have a
stable API. Once we hit `1.0.0`, we will make every effort to maintain a backwards compatible API and use the MAJOR,
MINOR, and PATCH versions on each release to indicate any incompatibilities.

## References
[1] https://stackoverflow.com/questions/70585521/clean-ambassador-edge-stack-install-on-gke-fails-with-dns-resolving

## License

Please see [LICENSE](https://github.com/neutrino-io/terraform-google-foundation/blob/master/LICENSE) for how the code in
this repo is licensed.