# Terraform: AWS EC2 Security Groups (three-tier example)

This folder contains Terraform code to create security groups for a three-tier architecture:
- web-tier (public HTTP/HTTPS + SSH from bastion)
- app-tier (app port only from web-tier + SSH from bastion)
- database-tier (PostgreSQL only from app-tier; limited egress to S3 prefix list)
- bastion (SSH access from office CIDR)

## Usage

1. Create a `terraform.tfvars` with values for required variables:
```hcl
vpc_id               = "vpc-0123456789abcdef"
office_cidr          = "203.0.113.0/24"
private_subnet_cidr  = "10.0.1.0/24"
s3_prefix_list_id    = "pl-0abcd1234"
environment          = "prod"
region               = "us-east-1"

## Initialize & apply:

cd aws-ec2-security-groups/terraform
terraform init
terraform plan -out=tfplan
terraform apply tfplan

# Destroy (when needed):

terraform destroy


See theDevOpsTooling article: https://thedevopstooling.com/aws-ec2-security-groups-explained/