# Create VPC
resource "aws_vpc" "useast2" {
  provider = aws.east2
  cidr_block = "10.1.0.0/16"
  enable_dns_hostnames = true 
  tags = {
    Name = "VPC1-us-east-2"
  }
}


# Create Internet Gateway
resource "aws_internet_gateway" "useast2" {
  vpc_id = aws_vpc.useast2.id

}

# Create Public Subnet
resource "aws_subnet" "east2_public" {
  vpc_id     = aws_vpc.useast2.id 
  cidr_block = "10.1.0.0/24"
}

# Create Private Subnet
resource "aws_subnet" "east2_private" {
  vpc_id     = aws_vpc.useast2.id
  cidr_block = "10.1.1.0/24"
}

# Create Private Route Table
resource "aws_route_table" "private_east2" {
  vpc_id = aws_vpc.useast2.id 
}

# Create Public Route Table
resource "aws_route_table" "public_east2" {
  vpc_id = aws_vpc.useast2.id 

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.useast2.id 
  }
}

# Create Public Route Table and Public Subnet Association
resource "aws_route_table_association" "public_east2" {
  subnet_id      = aws_subnet.east2_public.id
  route_table_id = aws_route_table.public_east2.id
}

# Create Private Route Table and Private Subnet Association
resource "aws_route_table_association" "private_east2" {
  subnet_id      = aws_subnet.east2_private.id
  route_table_id = aws_route_table.private_east2.id
}