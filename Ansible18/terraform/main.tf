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
    bucket = "fikretmirzaev-terraform-devops2024" # please use your bucket name!
    key    = "ALB/tf-test-state.tfstate"          # Path to the state file in the bucket
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}
