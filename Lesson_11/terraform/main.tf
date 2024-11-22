terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>5"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.5"
    }
  }
  required_version = ">= 1.8"
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "test_t2_micro"{
  count = 1
  ami                  = "ami-0c7217cdde317cfec" # Ubuntu amd64 (x86_64)
  instance_type          = "t2.micro" # Free tier
  vpc_security_group_ids = [aws_security_group.web-sg.id]
  key_name = "jenkins-ansible"
  tags = {
    Name = "HelloWorld Server ${count.index + 1}"
  }
}

resource "random_pet" "sg" {}

resource "aws_security_group" "web-sg" {
  name = "${random_pet.sg.id}-sg"
  ingress {
    from_port   = 22
    to_port     = 9001
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 22
    to_port     = 9001
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
output "public_ips" {
  description = "Public IP addresses of the servers"
  value       = aws_instance.test_t2_micro[*].public_ip
}