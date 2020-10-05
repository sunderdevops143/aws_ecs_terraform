variable "aws_region" {}

variable "availability_zones" {}

variable "s3_ecs_bucket" {}

variable "ecs_cluster" {
  default     = "ecs_test_cluster"
}

variable "vpc" {
  description = "vpc attributes"
}

variable "launch_config" {
  description = "values passed to launch config"
}

variable "auto_scaling" {
  description = "auto scaling values i:e instance capacity"
}

variable "task_definition" {
  description = "vars required for creating task def"
}

variable "ecs_service" {
  description = "params related to ECS"
}

variable "load_balancer" {
  description = "params related to ALB"
}

variable "health_check" {
  description = "health check params for the ALB"
}

variable "target_group" {
  description = "these params are related to health checks of ALB"
}

