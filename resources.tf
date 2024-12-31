
resource "helm_release" "kargo" {
  namespace  = "kargo"
  create_namespace = true
  name       = "kargo"
  chart = "${var.charts_path}/kargo/"
  wait             = true
  timeout          = 600


  set {
    name  = "api.adminAccount.passwordHash"
    value = "2a$10$Zrhhie4vLz5ygtVSaif6o.qN36jgs6vjtMBdM6yrU1FOeiAAMMxOm"
  }

  set {
    name  = "api.adminAccount.tokenSigningKey"
    value = "iwishtowashmyirishwristwatch"
  }

  depends_on = [helm_release.ingress_nginx]
}
