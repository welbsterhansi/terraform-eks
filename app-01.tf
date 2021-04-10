resource "helm_release" "nginx" {
  name       = "nginx"
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "nginx"
  namespace = "app-01"
  create_namespace = true
}