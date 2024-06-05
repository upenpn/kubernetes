kubeconfig_path = "~/.kube/config"
namespace       = "default"
app_name        = "my-nginx-app"
app_label       = "nginx"
image           = "nginx:latest"
service_port    = 8080
target_port     = 80
service_type    = "LoadBalancer"
