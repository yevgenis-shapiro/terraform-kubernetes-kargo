output "cluster-name" {
  value = kind_cluster.default.name
}

output "kubeconfig" {
  value = kind_cluster.default.kubeconfig
}
