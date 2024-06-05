variable "kubeconfig_path" {
  description = "Path to the kubeconfig file"
  type        = string
}

variable "namespace" {
  description = "Namespace for the component"
  type        = string
  default     = "default"
}

variable "app_name" {
  description = "Name of the application and associated resources"
  type        = string
  default     = "terraform-example"
}

variable "app_label" {
  description = "Label used to connect the service to the pod"
  type        = string
  default     = "MyApp"
}

variable "image" {
  description = "Docker image for the Kubernetes pod"
  type        = string
  default     = "nginx:1.21.6"
}

variable "service_port" {
  description = "Port exposed by the Kubernetes service"
  type        = number
  default     = 8080
}

variable "target_port" {
  description = "Port on the container that the service directs traffic to"
  type        = number
  default     = 80
}

variable "service_type" {
  description = "Type of service to create"
  type        = string
  default     = "LoadBalancer"
}
