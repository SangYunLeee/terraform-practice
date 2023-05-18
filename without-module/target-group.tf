resource "aws_lb_target_group" "backend" {
  name     = "tf-backend-lb-tg"
  port     = 80
  protocol = "HTTP"
  target_type = "instance"
  vpc_id   = aws_vpc.new_vpc.id
  health_check {
    interval  = 10
    matcher   = "200-299"
    path      = "/"
  }
}

resource "aws_lb_target_group_attachment" "test" {
  target_group_arn = aws_lb_target_group.backend.arn
  target_id        = aws_instance.backend.id
  port             = 80
}
