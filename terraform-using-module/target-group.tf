resource "aws_lb_target_group" "backend" {
  name     = "tf-backend-lb-tg"
  port     = 80
  protocol = "HTTP"
  target_type = "instance"
  vpc_id   = module.vpc.vpc_id
  health_check {
    interval  = 10
    matcher   = "200-299"
    path      = "/"
  }
}
