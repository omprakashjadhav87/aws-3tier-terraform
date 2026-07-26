#By using this block we can get DNS link

#DNS of LoadBalancer

output "lb_dns_name" {

  description = "DNS of Loadbalancer"

  value = aws_lb.external_alb.dns_name

}