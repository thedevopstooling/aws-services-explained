variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "vpc_id" {
  description = "VPC ID where Security Groups will be created"
  type        = string
}

variable "environment" {
  description = "Environment name (dev, staging, prod)"
  type        = string
  default     = "dev"
}

variable "office_cidr" {
  description = "CIDR block for office network"
  type        = string
}

variable "private_subnet_cidr" {
  description = "CIDR block for private subnets"
  type        = string
}

variable "s3_prefix_list_id" {
  description = "Prefix list ID for S3 VPC endpoint (for egress)"
  type        = string
  default     = null
}
