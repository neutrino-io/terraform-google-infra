locals {
  name               = "camel-k"
  operator_version   = tostring(var.operator_version) != null ? var.operator_version : "0.13"
  operator_namespace = tostring(var.operator_namespace) != null ? var.operator_namespace : "neutrino-camel-k"
}

resource "kubernetes_namespace" "system-camel_k" {
  metadata {
    labels = {
      app    = var.app_org_id
      system = local.name
    }

    name = local.operator_namespace
  }
}

resource "helm_release" "camel_k" {
  name       = "${local.name}-operator"
  namespace  = local.operator_namespace
  repository = "https://apache.github.io/camel-k/charts"
  chart      = "camel-k"
  version    = local.operator_version

  set {
    name  = "platform.build.registry.address"
    value = "gcr.io"
  }

  set {
    name  = "platform.build.registry.organization"
    value = var.project_id
  }

  set {
    name  = "platform.build.registry.insecure"
    value = true
  }

  set {
    name  = "platform.build.publishStrategy"
    value = "Kaniko"
  }

  dynamic "set" {
    for_each = var.operator_settings == null ? {} : var.operator_settings

    content {
      name  = set.key
      value = set.value
    }
  }

  depends_on = [
    kubernetes_namespace.system-camel_k,
  ]
}

resource "kubernetes_cluster_role_binding" "camel-k-clusterrole" {
  metadata {
    name = "camel-k-clusterrole"
  }
  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = "cluster-admin"
  }

  subject {
    kind      = "ServiceAccount"
    name      = "camel-k-operator"
    namespace = local.operator_namespace
  }

  depends_on = [
    kubernetes_namespace.system-camel_k
  ]
}

resource "kubernetes_annotations" "patch-watch-ns" {
  api_version = "apps/v1"
  kind        = "Deployment"
  metadata {
    name      = "${local.name}-operator"
    namespace = local.operator_namespace
  }
  annotations = {
    "watchNamespace" = ""
  }

  depends_on = [
    kubernetes_namespace.system-camel_k,
    helm_release.camel_k
  ]
}

resource "kubectl_manifest" "patch-watch-ns" {
  yaml_body = <<YAML
  apiVersion: apps/v1
  kind: Deployment
  metadata:
    name: ${local.name}-operator
    namespace: ${local.operator_namespace}
  spec:
    selector:
      matchLabels:
        name: camel-k-operator
    template:
      spec:
        containers:
        - name: camel-k-operator
          env:
          - name: WATCH_NAMESPACE
            valueFrom:
              fieldRef:
                fieldPath: metadata.annotations['watchNamespace']
  YAML

  server_side_apply = true
  force_conflicts   = true

  depends_on = [
    kubernetes_namespace.system-camel_k,
    helm_release.camel_k,
    kubernetes_annotations.patch-watch-ns
  ]
}
