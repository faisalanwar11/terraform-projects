# ------------------------------------------------------------------------------
# VPC Network Infrastructure
# This configuration sets up a custom VPC with public/private subnets,
# an internet gateway, and routing for public subnet internet access.
# ------------------------------------------------------------------------------

# ------------------------------------------------------------------------------
# VPC
# ------------------------------------------------------------------------------

# Create a custom VPC with CIDR block 10.0.0.0/16 to host public and private subnets
resource "aws_vpc" "web_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name      = "web-vpc"
    Terraform = "true"
  }
}

# ------------------------------------------------------------------------------
# Internet Gateway
# ------------------------------------------------------------------------------
# Attach an Internet Gateway to the VPC to enable internet access for public subnets
resource "aws_internet_gateway" "web-igw" {
  vpc_id = aws_vpc.web_vpc.id

  tags = {
    Name      = "web-igw"
    Terraform = "true"
  }
}

# ------------------------------------------------------------------------------
# Subnets
# ------------------------------------------------------------------------------
# Create a Public Subnet (e.g., 10.0.1.0/24) for internet-facing resources
resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.web_vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name      = "public-subnet"
    Terraform = "True"
  }
}

# Create a Private Subnet (e.g., 10.0.2.0/24) for internal resources (no internet)
resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.web_vpc.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name      = "private-subnet"
    Terraform = "True"
  }
}

# ------------------------------------------------------------------------------
# Route Table (Public)
# ------------------------------------------------------------------------------
# Create a route table for the public subnet and add a route to the internet
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.web_vpc.id

  route {
    cidr_block = "0.0.0.0/0"                     # Route all outbound traffic
    gateway_id = aws_internet_gateway.web-igw.id # via the Internet Gateway
  }

  tags = {
    Name      = "public-rt"
    Terraform = "True"
  }
}

# ------------------------------------------------------------------------------
# Route Table Association (Public Subnet)
# ------------------------------------------------------------------------------
# Associate the public subnet with the public route table to enable internet access
resource "aws_route_table_association" "public_subnet_associate" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_rt.id
}
