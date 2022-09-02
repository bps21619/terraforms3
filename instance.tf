resource "aws_instance" "myinstance" {
      ami = "ami-068257025f72f470d"
      instance_type = "t2.micro"
      vpc_security_group_ids = [ aws_security_group.myvpc_security.id]
      subnet_id = aws_subnet.myvpc_subnet.id
      associate_public_ip_address = true
      key_name = "new-ac-mumbai"

      tags ={
        Name = "myinstance"

      }
      connection {
         type = "ssh"
         user = "ubuntu"
         private_key = file("${path.module}/new-ac-mumbai.pem")
         host = aws_instance.myinstance.public_ip
      }
      provisioner "remote-exec" {
        inline = [
          "sudo apt update",
          "sudo apt install nginx -y"
        ]
        
      }

}