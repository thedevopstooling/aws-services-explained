terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  required_version = ">= 1.4.0"
}

provider "aws" {
  region = var.region
}

#
# Web Tier Security Group
#
resource "aws_security_group" "web_tier" {
  name        = "web-tier-sg"
  description = "Security group for web tier - allows public HTTP/HTTPS"
  vpc_id      = var.vpc_id

  ingress {
    description = "HTTP from public internet"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTPS from public internet"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description     = "SSH from bastion host"
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.bastion.id]
  }

  egress {
    description = "Allow all outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "web-tier-sg"
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

#
# Application Tier Security Group
#
resource "aws_security_group" "app_tier" {
  name        = "app-tier-sg"
  description = "Security group for application tier - only accessible from web tier"
  vpc_id      = var.vpc_id

  ingress {
    description     = "Application port from web tier"
    from_port       = 8080
    to_port         = 8080
    protocol        = "tcp"
    security_groups = [aws_security_group.web_tier.id]
  }

  ingress {
    description     = "SSH from bastion host"
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.bastion.id]
  }

  egress {
    description = "Allow all outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "app-tier-sg"
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

#
# Database Tier Security Group
#
resource "aws_security_group" "database" {
  name        = "database-sg"
  description = "Security group for database tier - only accessible from app tier"
  vpc_id      = var.vpc_id

  ingress {
    description     = "PostgreSQL from application tier"
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    security_groups = [aws_security_group.app_tier.id]
  }

  egress {
    description    = "Allow HTTPS to S3 VPC endpoint for backups"
    from_port      = 443
    to_port        = 443
    protocol       = "tcp"
    prefix_list_ids = [var.s3_prefix_list_id]
  }

  tags = {
    Name        = "database-sg"
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

#
# Bastion Host Security Group
#
resource "aws_security_group" "bastion" {
  name        = "bastion-sg"
  description = "Security group for bastion host - restricted SSH access"
  vpc_id      = var.vpc_id

  ingress {
    description = "SSH from office network"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.office_cidr]
  }

  egress {
    description = "SSH to private subnets"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.private_subnet_cidr]
  }

  tags = {
    Name        = "bastion-sg"
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}
