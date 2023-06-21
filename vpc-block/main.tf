provider "aws" {
    region = "us-east-1"
  
}
resource "aws_vpc" "main" {
	cidr_block	= var.vpcidr
	instance_tenancy = "default"

	tags = {
		Name = "MyVPC"
	}
}
resource "aws_subnet" "priv-subnets" {
	count 			  = 3
	availability_zone = element(data.aws_availability_zones.az.names,count.index)
	vpc_id	 		  = aws_vpc.main.id
	cidr_block 		  = element(var.subcidr-priv,count.index)

		tags = {
		Name = "${var.project}Private-Sub-${count.index}"
}
}
resource "aws_subnet" "pub-subnets" {
	count 			  = 3
	availability_zone = element(data.aws_availability_zones.az.names,count.index)
	vpc_id			  = aws_vpc.main.id
	cidr_block 		  = element(var.subcidr-pub,count.index)

		tags = {
		Name = "${var.project}-Public-Sub-${count.index}"
}
}
resource "aws_eip" "eip" {
	vpc = true
  
}
resource "aws_internet_gateway" "IG" {
	vpc_id = aws_vpc.main.id

	tags = {
		Name = "${var.project}-IG"
	}
}
resource "aws_nat_gateway" "NAT" {
	allocation_id = aws_eip.eip.id
	subnet_id = aws_subnet.pub-subnets[0].id

	tags = {
	  Name = "${var.project}-NAT"
	}
}
module "Route_table" {
  source = "../route-table-block"
  vpcid = aws_vpc.main.id
  gateway = aws_internet_gateway.IG.id
  gateway-priv = aws_nat_gateway.NAT.id
  count = length(aws_subnet.pub-subnets)
  
  subnet_association-priv = aws_subnet.priv-subnets[0].id
  subnet_association-pub = aws_subnet.pub-subnets[0].id

}