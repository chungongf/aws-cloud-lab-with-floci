output "vpc_id" {
  description = "ID of the VPC created by the vpc module"
  value       = module.vpc.vpc_id
}

output "s3_bucket_name" {
  description = "Name of the S3 bucket created by the s3 module"
  value       = module.s3.bucket_name
}

output "ecr_repository_url" {
  description = "URL of the ECR repository created by the ecr module"
  value       = module.ecr.repository_url
}
