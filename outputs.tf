output "bucket_name" {
  description = "Name of the S3 bucket created"
  value       = aws_s3_bucket.acme_assets.bucket
}

output "bucket_arn" {
  description = "ARN of the S3 bucket"
  value       = aws_s3_bucket.acme_assets.arn
}

output "bucket_region" {
  description = "AWS region where the bucket was created"
  value       = var.aws_region
}

output "environment" {
  description = "Deployment environment"
  value       = var.environment
}

