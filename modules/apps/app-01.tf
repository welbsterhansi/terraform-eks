### Deploy of the nginx
resource "helm_release" "nginx" {
  name       = "nginx"
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "nginx"
  namespace = "app-01"
  create_namespace = true

### Setting replicas
  set {
    name = "replicaCount"
    value = "2"
  }

### Setting resources (CPU and Memory)  
  set {
    name = "resources.requests.cpu"
    value = "50m"
  }
  set {
    name = "resources.requests.memory"
    value = "50Mi"
  }
  set {
    name = "resources.limits.cpu"
    value = "200m"
  }
  set {
    name = "resources.limits.memory"
    value = "256Mi"
  }
}

### Create Horizontal Pod Autoscaler
resource "kubernetes_horizontal_pod_autoscaler" "nginx" {
  metadata {
    name = "nginx"
    namespace = "app-01"
  }

  spec {
    max_replicas = 5
    min_replicas = 1
    target_cpu_utilization_percentage = 70

    scale_target_ref {
      kind = "Deployment"
      name = "nginx"
    }
  }
}