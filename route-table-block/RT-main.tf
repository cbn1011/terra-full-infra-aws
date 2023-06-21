terraform {
  required_version = ">=0.12"
}
resource "aws_route_table" "Pub-Route" {
  vpc_id = var.vpcid
  route {
    cidr_block = var.cidr
    gateway_id = var.gateway
  }
  route {
    ipv6_cidr_block = var.cidripv6
  }
  tags = {
    Name = "${var.project}-Pub-Route"
  }
}
resource "aws_route_table" "Priv-Route" {
  vpc_id = var.vpcid
  route {
    cidr_block = var.cidr
    gateway_id = var.gateway-priv
  }
  tags = {
    Name = "${var.project}-Priv-Route"
  }
}
#Route table subnets association
resource "aws_route_table_association" "Private-Sub" {
  subnet_id = var.subnet_association-priv
  route_table_id = aws_route_table.Priv-Route.id
}
resource "aws_route_table_association" "Public-Sub" {
  subnet_id = var.subnet_association-pub
  route_table_id = aws_route_table.Pub-Route.id
}