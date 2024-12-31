data "external" "subnet" {
  program = ["/bin/bash", "-c", "docker network inspect -f '{{json .IPAM.Config}}' kind | jq .[0]"]
  depends_on = [
    kind_cluster.default
  ]
}
resource "helm_release" "metallb" {
  name             = "metallb"
  repository       = "https://metallb.github.io/metallb"
  chart            = "metallb"
  namespace        = "metallb"
  version          = "0.10.3"
  create_namespace = true
  timeout = 300
  values = [
    <<-EOF
  configInline:
    address-pools:
    - name: default
      protocol: layer2
      addresses:
      # - ${cidrhost(data.external.subnet.result.Subnet, 150)}-${cidrhost(data.external.subnet.result.Subnet, 200)}
      - 172.18.255.1-172.18.255.250
  EOF
  ]
  depends_on = [
    kind_cluster.default
  ]
}

resource "null_resource" "wait_for_metallb" {
  triggers = {
    key = uuid()
  }

  provisioner "local-exec" {
    command = <<EOF
      printf "\nWaiting for the metallb controller...\n"
      kubectl wait --namespace ${helm_release.metallb.namespace} \
        --for=condition=ready pod \
        --selector=app.kubernetes.io/component=speaker \
        --timeout=90s
    EOF
  }

  depends_on = [helm_release.metallb]
}
