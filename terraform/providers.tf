terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend "s3" {
    bucket  = "dhole-backend"
    key     = "state/terraform.tfstate"
    region  = "eu-west-1"
    profile = "personal_aws_account"
  }
}

provider "aws" {
  region  = var.region
  profile = var.dhole_profile
  default_tags {
    tags = merge(var.default_tags)
  }
}
