resource "helm_release" "tomcat" {
  name       = "tomcat"
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "tomcat"
  namespace = "app-02"
  create_namespace = true
}

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
resource "kubernetes_horizontal_pod_autoscaler" "tomcat" {
  metadata {
    name = "tomcat"
    namespace = "app-02"
  }

	spec {
    max_replicas = 5
    min_replicas = 1

		scale_target_ref {
			api_version = "apps/v1"
			kind = "Deployment"
			name = "tomcat"
		}

		metric {
			type = "Resource"

			resource {
				name = "memory"

				target {
					type = "Utilization"
					average_utilization = 60
				}
			}
		}

	}
}