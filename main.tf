# ------------------------------------------------------------------------------
# Terraform Provider Configuration
# Specifies the AWS provider and region for infrastructure deployment
# ------------------------------------------------------------------------------

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"   # Use the official AWS provider from HashiCorp
      version = "~> 5.0"          # Use any version >=5.0 and <6.0
    }
  }
}

# ------------------------------------------------------------------------------
# AWS Provider
# Configures the provider with the desired AWS region
# ------------------------------------------------------------------------------

provider "aws" {
  region = "ap-south-1"           # Deploy resources in Asia Pacific (Mumbai) region
}
