output "ecs_alb" {
  value       = aws_lb.ecs_alb.dns_name
  description = "Application load balancer DNS"
}