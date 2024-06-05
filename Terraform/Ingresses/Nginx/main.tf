resource "kubernetes_deployment" "nginx" {
  metadata {
    name      = var.app_name
    namespace = var.namespace
  }

  spec {
    replicas = 3
    selector {
      match_labels = {
        app = var.app_label
      }
    }
    template {
      metadata {
        labels = {
          app = var.app_label
        }
      }
      spec {
        container {
          name  = var.app_label
          image = var.image
          ports {
            container_port = var.target_port
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "nginx" {
  metadata {
    name      = var.app_name
    namespace = var.namespace
  }

  spec {
    selector = {
      app = kubernetes_deployment.nginx.spec[0].template[0].metadata[0].labels.app
    }
    port {
      port        = var.service_port
      target_port = var.target_port
    }
    type = var.service_type
  }
}
