resource "aws_lb" "ecs_alb" {
  name            = var.load_balancer["name"]
  security_groups = ["${aws_security_group.public_sg.id}"]
  subnets         =  ["${aws_subnet.public_subnet_1.id}", "${aws_subnet.public_subnet_2.id}"]
  enable_http2    = "true"
  idle_timeout    = var.load_balancer["idle_timeout"]
  tags = {
    Name = var.load_balancer["name"]
  }
}



resource "aws_lb_target_group" "target_group" {
  name     = var.target_group["name"]
  port     = var.target_group["port"]
  protocol = var.target_group["protocol"]
  vpc_id   = aws_vpc.ecs_vpc.id
  health_check {
    healthy_threshold   = var.health_check["healthy_threshold"]
    unhealthy_threshold = var.health_check["unhealthy_threshold"]
    interval            = var.health_check["interval"]
    matcher             = var.health_check["matcher"]
    path                = var.health_check["path"]
    timeout             = var.health_check["timeout"]
  }
  
  tags = {
    Name = var.target_group["name"]
  }
  depends_on = [
    aws_lb.ecs_alb,
  ]
}

resource "aws_lb_listener" "alb-listener" {
  load_balancer_arn = aws_lb.ecs_alb.arn
  port              = var.load_balancer["port"]
  protocol          = var.load_balancer["protocol"]

  default_action {
    target_group_arn = aws_lb_target_group.target_group.arn
    type             = var.load_balancer["type"]
  }
}
