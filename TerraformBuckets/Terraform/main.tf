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
#### enable remote TF state
  backend "s3" {
  bucket         = "#######" # please use your bucket name!!!
  key            = "deveop-lessons/tf-test-state.tfstate"  # Path to the state file in the bucket
  region         = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "test_t2_micro"{
  ami                  = "ami-0c7217cdde317cfec" # Ubuntu amd64 (x86_64)
  instance_type          = "t2.micro" # Free tier
  vpc_security_group_ids = [aws_security_group.web-sg.id]
  user_data              = <<-EOF
    #!/bin/bash
    sudo apt-get update
    sudo apt-get install -y apache2
    sudo systemctl start apache2
    sudo systemctl enable apache2
    sudo bash -c 'cat > /var/www/html/index.html' <<EOF_HTML
    <!DOCTYPE html>
    <html>
    <head>
    <style>
      body {
        background-color: #A1B0FF;
        text-align: center;
      }
    </style>
    </head>
    <body>
      <h1>Hello, Team.</h1>
      <h1>Welcome to server 1!</h1>
    </body>
    </html>
    EOF_HTML
  EOF
  tags = {
    Name = "HelloWorld Server"
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