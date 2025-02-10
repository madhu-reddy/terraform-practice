resource "aws_vpc" "example" {
  cidr_block = var.vpc_cidr_block
}

resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.example.id
  cidr_block              = var.public_subnet_cidr
  availability_zone       = var.availability_zone_public
  map_public_ip_on_launch = true
}

resource "aws_subnet" "private" {
  vpc_id                  = aws_vpc.example.id
  cidr_block              = var.private_subnet_cidr
  availability_zone       = var.availability_zone_private
  map_public_ip_on_launch = false
}

resource "aws_internet_gateway" "example" {
  vpc_id = aws_vpc.example.id
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.example.id
}

resource "aws_route" "public_internet" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.example.id
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.example.id
}

resource "aws_route_table_association" "private" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.private.id
}

resource "aws_vpc_endpoint" "s3_gateway" {
  vpc_id       = aws_vpc.example.id
  service_name = "com.amazonaws.${var.region}.s3"

  route_table_ids = [
    aws_route_table.private.id
  ]
}
