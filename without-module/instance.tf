resource "aws_instance" "backend" {
  ami                    = "ami-0970cc54a3aa77466"
  instance_type          = "t2.micro"
  subnet_id              = "${aws_subnet.public_subnet_1a.id}"
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
