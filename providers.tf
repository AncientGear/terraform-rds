terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 6.0.0, < 6.3.0, != 6.0.0"
    }
  }
  required_version = "~>1.12.0"
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}