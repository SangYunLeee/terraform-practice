resource "aws_instance" "backend" {
  ami                    = "ami-0970cc54a3aa77466"
  instance_type          = "t2.micro"
  subnet_id              = module.vpc.public_subnets[0]
  vpc_security_group_ids = [aws_security_group.backend.id]
  key_name  = "key"
	user_data = <<-EOT
            #!/bin/bash
            echo "Hello, World" > index.html
            nohup busybox httpd -f -p 80 &
  EOT

  tags = {
    Name = "terraform-example"
  }
}

resource "aws_lb_target_group_attachment" "test" {
  target_group_arn = aws_lb_target_group.backend.arn
  target_id        = aws_instance.backend.id
  port             = 80
}
