resource "kubernetes_cluster_role_binding" "strimzi_clusterrole_topic" {
  metadata {
    name = "strimzi-cluster-operator-topic-operator-delegation"
  }
  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = "strimzi-topic-operator"
  }

  subject {
    kind      = "ServiceAccount"
    name      = "strimzi-cluster-operator"
    namespace = "system-strimzi"
  }

  depends_on = [
    helm_release.strimzi_operator
  ]
}

resource "kubernetes_cluster_role_binding" "strimzi_clusterrole_user" {
  metadata {
    name = "strimzi-cluster-operator-user-operator-delegation"
  }
  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = "strimzi-user-operator"
  }

  subject {
    kind      = "ServiceAccount"
    name      = "strimzi-cluster-operator"
    namespace = "system-strimzi"
  }

  depends_on = [
    helm_release.strimzi_operator
  ]
}