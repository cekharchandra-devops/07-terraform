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

resource "aws_instance" "ec2_vars" {
    count = length(var.instances)
    ami =  var.ami_id
    instance_type = var.instances[count.index] == "mysql" ? "t3.small" : "t3.micro"
    vpc_security_group_ids = [ aws_security_group.allow_ssh.id ]
    tags = {
      Name = var.instances[count.index]
    }
}

