provider "kubernetes" {
  config_path = "~/.kube/config"
}

# Example: Create a Kubernetes namespace
resource "kubernetes_namespace" "example" {
  metadata {
    name = "example"
  }
}

# Example: Create a Kubernetes deployment
resource "kubernetes_deployment" "nginx" {
  metadata {
    name      = "nginx-deployment"
    namespace = kubernetes_namespace.example.metadata[0].name
  }

  spec {
    replicas = 2

    selector {
      match_labels = {
        app = "nginx"
      }
    }

    template {
      metadata {
        labels = {
          app = "nginx"
        }
      }

      spec {
        container {
          name  = "nginx"
          image = "nginx:1.14.2"

          port {
            container_port = 80
          }
        }
      }
    }
  }
}

# Example: Create a Kubernetes service
resource "kubernetes_service" "nginx" {
  metadata {
    name      = "nginx-service"
    namespace = kubernetes_namespace.example.metadata[0].name
  }

  spec {
    selector = {
      app = "nginx"
    }

    port {
      port        = 80
      target_port = 80
    }

    type = "ClusterIP"
  }
}
