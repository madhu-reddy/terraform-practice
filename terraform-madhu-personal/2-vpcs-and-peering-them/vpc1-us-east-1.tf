# Create VPC
resource "aws_vpc" "useast1" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true 
  tags = {
    Name = "VPC1-us-east-1"
  }
}

# Create Internet Gateway
resource "aws_internet_gateway" "useast1" {
  vpc_id = aws_vpc.useast1.id

}

# Create Public Subnet
resource "aws_subnet" "east1_public" {
  vpc_id     = aws_vpc.useast1.id
  cidr_block = "10.0.0.0/24"
}

# Create Private Subnet
resource "aws_subnet" "east1_private" {
  vpc_id     = aws_vpc.useast1.id
  cidr_block = "10.0.1.0/24"
}

# Create Private Route Table
resource "aws_route_table" "private_east1" {
  vpc_id = aws_vpc.useast1.id 
}

# Create Public Route Table
resource "aws_route_table" "public_east1" {
  vpc_id = aws_vpc.useast1.id 

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.useast1.id
  }
}

# Create Public Route Table and Public Subnet Association
resource "aws_route_table_association" "public_east1" {
  subnet_id      = aws_subnet.east1_public.id
  route_table_id = aws_route_table.public_east1.id
}

# Create Private Route Table and Private Subnet Association
resource "aws_route_table_association" "private_east1" {
  subnet_id      = aws_subnet.east1_private.id
  route_table_id = aws_route_table.private_east1.id 
}