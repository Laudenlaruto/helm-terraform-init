resource "kubernetes_service_account" "tiller" {
  metadata {
    name = "tiller"
    namespace = "tiller"
  }
  secret {
    name = "${kubernetes_secret.tiller.metadata.0.name}"
  }
}

resource "kubernetes_secret" "tiller" {
  metadata {
    name = "tiller"
  }
}
resource "kubernetes_namespace" "tiller" {
  metadata {
    annotations = {
      name = "tiller"
    }

    labels = {
      app = "tiller"
    }

    name = "tiller"
  }
}
resource "kubernetes_cluster_role_binding" "tiller" {
  metadata {
    name = "${kubernetes_secret.tiller.metadata.0.name}"
  }

  subject {
    kind      = "ServiceAccount"
    name      = "tiller"
    namespace = "tiller"
  }

  role_ref {
    api_group= "rbac.authorization.k8s.io"
    kind  = "ClusterRole"
    name = "cluster-admin"
  }
} 