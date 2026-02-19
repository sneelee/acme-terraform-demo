terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.5"
    }
  }

  cloud {
    organization = "acme-terraform-2026"

    workspaces {
  tags = ["acme-ecom-demo"]
  }
  }
}

provider "aws" {
  region = var.aws_region
}

resource "random_id" "suffix" {
  byte_length = 4
}

resource "aws_s3_bucket" "acme_assets" {
  bucket = "${var.environment}-acme-assets-${random_id.suffix.hex}"

  tags = {
    Team        = var.team_name
    Environment = var.environment
    ManagedBy   = "Terraform Cloud"
    Project     = "ACME E-Commerce Platform"
    CostCenter = "ecommerce-platform"
  }
}

resource "aws_s3_bucket_public_access_block" "acme_assets" {
  bucket = aws_s3_bucket.acme_assets.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_versioning" "acme_assets" {
  bucket = aws_s3_bucket.acme_assets.id

  versioning_configuration {
    status = "Enabled"
  }
}
