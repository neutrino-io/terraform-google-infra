resource "kubernetes_namespace" "system_strimzi" {
  metadata {
    labels = {
      app    = var.app_org_id
      system = "strimzi"
    }

    name = "system-strimzi"
  }
}

resource "helm_release" "strimzi_operator" {
  name       = "strimzi-operator"
  namespace  = "system-strimzi"
  repository = "https://strimzi.io/charts"
  chart      = "strimzi-kafka-operator"
  version    = "0.33.2"

  set {
    name  = "watchAnyNamespace"
    value = true
  }

  depends_on = [
    kubernetes_namespace.system_strimzi
  ]
}

resource "helm_release" "strimzi_registry_operator" {
  name       = "strimzi-registry-operator"
  namespace  = "system-strimzi"
  repository = "https://lsst-sqre.github.io/charts"
  chart      = "strimzi-registry-operator"

  set {
    name  = "clusterName"
    value = "cluster-core-kafka"
  }

  set {
    name  = "clusterNamespace"
    value = "system-strimzi"
  }

  set {
    name  = "operatorNamespace"
    value = "system-strimzi"
  }

  depends_on = [
    kubernetes_namespace.system_strimzi
  ]
}
