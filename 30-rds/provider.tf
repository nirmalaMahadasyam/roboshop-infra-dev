terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.66.0"
    }
  }

  backend "s3" {
    bucket = "nirmala-s3bucket"
    key    = "roboshop-rds-dev"
    region = "us-east-1"
    dynamodb_table = "nirmala-lockingtb"
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}