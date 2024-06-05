resource "kubernetes_network_policy" "example" {
  metadata {
    name      = var.app_name
    namespace = var.namespace
  }

  spec {
    pod_selector {
      match_labels = {
        app = var.app_label
      }
    }
    ingress {
      from {
        pod_selector {
          match_labels = {
            app = "allowed-app"
          }
        }
      }
      ports {
        protocol = "TCP"
        port     = var.target_port
      }
    }
  }
}

resource "kubernetes_pod" "example" {
  metadata {
    name      = var.app_name
    namespace = var.namespace
    labels = {
      app = var.app_label
    }
  }

  spec {
    container {
      image = var.image
      name  = var.app_label
    }
  }
}

resource "kubernetes_pod" "allowed" {
  metadata {
    name      = "allowed-pod"
    namespace = var.namespace
    labels = {
      app = "allowed-app"
    }
  }

  spec {
    container {
      image = var.image
      name  = "allowed"
    }
  }
}
