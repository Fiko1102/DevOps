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
    bucket = "" # please use your bucket name!!!
    key    = "jenkins/tf-test-state.tfstate"     # Path to the state file in the bucket
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "test_t2_micro" {
  ami                    = "ami-0c7217cdde317cfec" # Ubuntu amd64 (x86_64)
  instance_type          = "c7a.medium"            # Free tier
  vpc_security_group_ids = [aws_security_group.web-sg.id]
  key_name               = "" # Please use your key name
  root_block_device {
    volume_size = 25 # Adjust size based on needs, in GB
    volume_type = "gp3"
  }
  tags = {
    Name = "My jenkins server"
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