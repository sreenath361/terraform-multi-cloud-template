# Create VPC
resource "aws_vpc" "Bosch-Dev" {
    cidr_block = var.vpc_cidr
    instance_tenancy = "default"
    enable_dns_support = true
    enable_dns_hostnames = true
    tags = {
        Name = var.vpc_name
	Owner = "Sreenath Reddy"
	environment = var.environment
    }
}

# Create Internet Gateway
resource "aws_internet_gateway" "Bosch-Dev-IGW" {
    vpc_id = aws_vpc.Bosch-Dev.id
	tags = {
        Name = var.IGW_name
    }
}
