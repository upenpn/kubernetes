output "load_balancer_ip" {
  value = kubernetes_service.example.status[0].load_balancer[0].ingress[0].ip
  description = "The external IP address of the LoadBalancer service"
}
