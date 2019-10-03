provider "helm" {
    # kubernetes {
    #     config_path = "/Users/benjamins/.kube/configk/kube_cluster.yaml"
    # }
    service_account = "tiller"
    namespace = "tiller"
}
