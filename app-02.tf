resource "helm_release" "wordpress" {
  name       = "wordpress"
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "wordpress"
  namespace = "app-02"
  create_namespace = true
}