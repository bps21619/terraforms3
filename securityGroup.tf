resource "aws_security_group" "myvpc_security" {
    vpc_id = aws_vpc.myvpc.id

    ingress  {
      cidr_blocks = [ "0.0.0.0/0" ]
      description = "allow ssh port"
      from_port = 22
      protocol = "tcp"
      self = false
      to_port = 22
    }
    ingress {
        cidr_blocks = [ "0.0.0.0/0" ]
        from_port = 80
        to_port = 80
        protocol = "tcp"
    }
    egress{
        cidr_blocks = [ "0.0.0.0/0" ]
        from_port = 0
        to_port = 0
        protocol = -1


    } 
    tags = {
      "Name" = "mysecurity"
    }
}