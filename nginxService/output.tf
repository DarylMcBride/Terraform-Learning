output "lb_ip" {
	value = "${kubernetes_service.nginx_service.load_balancer_ingress.0.hostname}"
}
