module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.vpc_name
  cidr = var.VpcCIDR

  azs             = [var.Zone1, var.Zone2, var.Zone3]
  private_subnets = [var.privsub1CIDR, var.privsub2CIDR]
  public_subnets  = [var.pubsub1CIDR, var.pubsub2CIDR]

  enable_dns_hostnames = true
  enable_nat_gateway   = true
  single_nat_gateway   = true
  enable_dns_support   = true

  tags = {
    Terraform   = "true"
    Environment = "Prod"
  }

  vpc_tags = {
    Name = var.vpc_name
  }
}

# Creates the following: 
# 1 VPC 
# Network Acl 
# Internet Gateway
# Route Table Pub/Priv
# Elastic Ip 
# Nat Gateway 
# Private Nat Gateway
# Public NGW  
# Association Route Table Pub/Priv
# 2 Public Subnets/2 Private Subnets 