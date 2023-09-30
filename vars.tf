variable "aws_region" {
  default     = "us-west-1"
  type        = string
  description = "Set AWS region"
}

variable "amis" {
  type = map(any)
  default = {
    us-west-1 = "ami-02daa508cbc334270" # Amazon Linux 2 AMI (HVM_)
    us-west-2 = "ami-038937b3d6616035f" # Amazon Linux 2 AMI (HVM_)
  }
}

variable "priv_key_path" {
  default     = "productionkey"
  type        = string
  description = "Private key"
  sensitive   = true
}

variable "pub_key_path" {
  default     = "productionkey.pub"
  type        = string
  description = "Public key"
  sensitive   = true
}

variable "username" {
  default     = "ec2-user"
  type        = string
  description = "Username for Instance"
}

variable "MyIp" {
  default     = "76.170.50.87/32"
  type        = string
  description = "Ipaddr"
  sensitive   = true
}

variable "instance_count" {
  default     = "1"
  type        = number
  description = "Number of instances being created"
}

variable "instance_type" {
  default     = "t2.micro"
  type        = string
  description = "instance tier"
}

variable "vpc_name" {
  default     = "two-tier-vpc"
  type        = string
  description = "Set name for main VPC Cidr block"
}

variable "db_tag" {
  default     = "arch-rds"
  type        = string
  description = "tag for RDS instance"
}

variable "db_name" {
  default     = "hr"
  type        = string
  description = "name for database"
}

variable "Zone1" {
  default     = "us-west-1a"
  description = "Zone for subnet"
}

variable "port" {
  default     = "3306"
  type        = number
  description = "port number for rds instance"
}

variable "Zone2" {
  default     = "us-west-1b"
  description = "Zone for subnet"
}

variable "Zone3" {
  default     = "us-west-1c"
  description = "Zone for subnet"
}

variable "VpcCIDR" {
  default = "172.31.0.0/16"
}

variable "pubsub1CIDR" {
  default = "172.31.1.0/24"
}

variable "pubsub2CIDR" {
  default = "172.31.2.0/24"
}


variable "privsub1CIDR" {
  default = "172.31.3.0/24"
}

variable "privsub2CIDR" {
  default = "172.31.4.0/24"
}