## Platform Builder - GCP Infrastructure

### Infra Deployment
Plan and apply the infra

```shell
# Select the workspace
terraform workspace select develop

# Plan and apply the infra
terraform plan -var-file=../../../env/env.develop.tfvars
terraform apply -var-file=../../../env/env.develop.tfvars
```

### Post Installation

- Manually add 8443 port rule in `gke-blacksmith-cluster-core-<env>-<sha>-master` ref: https://stackoverflow.com/questions/70585521/clean-ambassador-edge-stack-install-on-gke-fails-with-dns-resolving
- Manually add NS record of subdomain to parent domain
- Run kubectl create clusterrolebinding deployment-controller --clusterrole=cluster-admin --serviceaccount=kube-system:deployment-controller
- Run kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | grep deployment-controller | awk '{print $1}')