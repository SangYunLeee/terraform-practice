resource "aws_launch_configuration" "as_conf" {
  name_prefix   = "terraform-lc-backend"
  image_id      = "ami-0970cc54a3aa77466"
  instance_type = "t2.micro"
  key_name = "key"
	user_data = <<-EOT
            #!/bin/bash
            echo "Hello, World" > index.html
            nohup busybox httpd -f -p 80 &
  EOT
  security_groups = [aws_security_group.backend.id]
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "bar" {
  name                      = "terraform-asg-backend"
  launch_configuration      = aws_launch_configuration.as_conf.name
  vpc_zone_identifier       = [aws_subnet.public_subnet_1a.id, aws_subnet.public_subnet_2c.id]
  min_size                  = 2
  max_size                  = 4
  desired_capacity          = 3
  health_check_grace_period = 120
  health_check_type         = "ELB"
  target_group_arns    = [aws_lb_target_group.backend.arn]
  lifecycle {
    create_before_destroy = true
  }
}
