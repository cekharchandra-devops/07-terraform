resource "aws_security_group" "allow_ssh" {
  name = "allow_ssh"
  description = "allow ssh on port 22 for ingress traffic"
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [ "0.0.0.0/0" ]
  }
  tags = {
    Name = "allow_ssh"
  }
}

resource "aws_instance" "ec2" {
    ami = "ami-09c813fb71547fc4f"
    instance_type = "t3.micro"
    vpc_security_group_ids = [ aws_security_group.allow_ssh.id ]
    tags = {
      Name = "provisioners"
    }
    provisioner "local-exec" {
      command = "echo ${self.private_ip} >> ip.txt"
    }
    provisioner "remote-exec" {
      connection {
        type     = "ssh"
        user     = "ec2-user"
        password = "DevOps321"
        host     = self.public_ip

      }
      inline = [ 
        "sudo dnf install nginx -y",
        "sudo systemctl start nginx"
       ]
    }

}

