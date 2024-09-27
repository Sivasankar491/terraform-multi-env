terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.66.0"
    }
  }

  backend "s3" {
    bucket = "81s-remote-state-workspace"
    key    = "workspaces"
    region = "us-east-1"
    dynamodb_table = "81s-locking-workspace"
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}
