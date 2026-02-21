# acme-terraform-demo

Terraform code for the ACME Corp infrastructure demo — HashiCorp SE technical exercise.

## What it does

Provisions an S3 bucket on AWS using Terraform Cloud. The bucket has versioning enabled, public access blocked, and tags for team/environment tracking.It shows the full Terraform Cloud workflow end to end.

## Files

- `main.tf` — S3 bucket resource + Terraform Cloud config
- `variables.tf` — region, environment, team name
- `outputs.tf` — bucket name, ARN, region

## How to use

You'll need a Terraform Cloud account (free at app.terraform.io) and an AWS account.

1. Create a workspace in Terraform Cloud and connect it to this repo
2. Add your AWS credentials as environment variables in the workspace (`AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY` — mark the secret as sensitive)

4. Push a change to trigger a plan, review the output, then apply

## Why Terraform Cloud vs just running terraform locally

Running terraform locally works fine for one person. It breaks down when multiple engineers are touching the same infrastructure — state conflicts, no audit trail, credentials on laptops. Terraform Cloud handles state locking, run history, and team permissions out of the box.
