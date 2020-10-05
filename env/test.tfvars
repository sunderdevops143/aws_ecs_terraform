aws_region = "eu-west-1"

availability_zones = [
  "eu-west-1a",
  "eu-west-1b",
]

ecs_cluster = "ecs_cluster"

s3_ecs_bucket = "ecs_s3_bucket"


vpc = {
  "vpc_name"                    = "ecs_test_vpc"
  "cidr_block"                  = "10.0.0.0/16"
  "cidr_blocks"                 = ["10.0.1.0/24","10.0.2.0/24","10.0.3.0/24","10.0.4.0/24"]
  "internet_gateway_name"       = "ecs_igw"
  "elastic_ip_name"             = "ecs_eip"
  "nat_gateway"                 = "ecs_nw"
  "public_subnet_names"         = ["pub_sub_1","pub_sub_2"]
  "private_subnet_names"        = ["pri_sub_1","pri_sub_2"]
  "public_route_table_name"     = "public_rt"
  "private_route_table_name"    = "private_rt"
  "public_security_group_name"  = "public_sg"
  "private_security_group_name" = "private_sg"
}

launch_config = {
  "name"                  = "ecs_lc"
  "image_id"              = "ami-0489c3efb4fe85f5d"
  "instance_type"         = "t2.micro" 
  "public_ip"             = "false" 
  "root_volume_size"      = 30 
  "delete_on_termination" = true
}
auto_scaling = {
  "name"                  = "ecs_autoscaling_group"
  "maximum_instance_size" = 3
  "minimum_instance_size" = 2
  "desired_capacity"      = 2
  "health_check_type"     = "ELB" 
}

task_definition = {
  "family"     = "task_def"
  "image_name" = "nginx:latest"
  "name"       = "nginx"
  "essential"  = true
  "memory"     = 256
}

ecs_service = {
  "name"               = "ecs_service"
  "min_health_percent" = 50
  "max_health_percent" = 200
  "load_balancer_port" = 80
}

load_balancer = {
  "name"         = "alb"
  "idle_timeout" = 300
  "port"         = 80
  "protocol"     = "HTTP"
  "type"         = "forward"
}

health_check = {
  "healthy_threshold"   = "5"
  "unhealthy_threshold" = "3"
  "interval"            = "60"
  "matcher"             = "200"
  "path"                = "/"
  "port"                = "80"
  "protocol"            = "HTTP"
  "timeout"             = "10"
}

target_group = {
  "name"     = "targetgroup"
  "port"     = 8080 #80
  "protocol" = "HTTP"
}
