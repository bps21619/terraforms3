resource "aws_vpc" "myvpc" {

    cidr_block = "192.178.0.0/16"
    instance_tenancy = "default"


    tags = {
      "Name" = "myvpc"
    }
  
}
resource "aws_subnet" "myvpc_subnet" {

    vpc_id = aws_vpc.myvpc.id
    
    cidr_block = "192.178.1.0/24"
    tags = {
      "Name" = "mysubnet"
    }
}
resource "aws_internet_gateway" "myvpc_igw" {
    vpc_id = aws_vpc.myvpc.id
  
}
resource "aws_route_table" "myvpc_route_table" {
    vpc_id = aws_vpc.myvpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.myvpc_igw.id
    }
    tags = {
      "Name" = "myroute"
    }
  
}
resource "aws_route_table_association" "myroute" {
    subnet_id = aws_subnet.myvpc_subnet.id
    route_table_id = aws_route_table.myvpc_route_table.id
  
}