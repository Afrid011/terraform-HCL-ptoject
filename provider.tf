terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.68.0"
    }
  }
}

#configure the aws provider

provider "aws" {
  region = "ap-south-1"
}

