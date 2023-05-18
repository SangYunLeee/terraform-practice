# ALB 생성
  resource "aws_lb" "alb" {
  name               = "trf-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.backend.id]
  subnets            = module.vpc.public_subnets
}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.backend.arn
  }
}
