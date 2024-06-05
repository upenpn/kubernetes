resource "kubernetes_namespace" "istio_system" {
  metadata {
    name = "istio-system"
  }
}

resource "helm_release" "istio_base" {
  name       = "istio-base"
  repository = "https://istio-release.storage.googleapis.com/charts"
  chart      = "base"
  namespace  = kubernetes_namespace.istio_system.metadata[0].name
}

resource "helm_release" "istiod" {
  name       = "istiod"
  repository = "https://istio-release.storage.googleapis.com/charts"
  chart      = "istiod"
  namespace  = kubernetes_namespace.istio_system.metadata[0].name
}

resource "kubernetes_service" "example" {
  metadata {
    name      = var.app_name
    namespace = var.namespace
    labels = {
      app = var.app_label
    }
  }

  spec {
    selector = {
      app = var.app_label
    }
    port {
      port        = var.service_port
      target_port = var.target_port
    }
    type = var.service_type
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
