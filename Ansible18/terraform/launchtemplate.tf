resource "aws_launch_template" "server_template" {
  name = "server-template"

  image_id      = "ami-0c7217cdde317cfec" # Ubuntu AMI
  instance_type = "t2.micro"
  key_name      = "Ansible"

  network_interfaces {
    associate_public_ip_address = true
    security_groups             = [aws_security_group.web-sg.id]
  }

  tags = {
    Name = "Server Template"
  }
}
