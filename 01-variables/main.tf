resource "aws_security_group" "allow_ssh" {
  name = "allow_ssh"
  description = "allow ssh on port 22 for ingress traffic"
  ingress {
    from_port = var.ingress_from_port
    to_port = var.ingress_to_port
    protocol = "tcp"
    cidr_blocks = var.ingress_cidr_blocks
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [ "0.0.0.0/0" ]
  }
  tags = var.sg_tags
}

resource "aws_instance" "ec2_vars" {

    ami =  var.ami_id
    instance_type = var.instance_type
    vpc_security_group_ids = [ aws_security_group.allow_ssh.id ]
    tags = var.ec2_tags
}

# Terraform loads variables in the following order, with later sources taking precedence over earlier ones:

# Environment variables
# The terraform.tfvars file, if present.
# The terraform.tfvars.json file, if present.
# Any *.auto.tfvars or *.auto.tfvars.json files, processed in lexical order of their filenames.
# Any -var and -var-file options on the command line, in the order they are provided. (This includes variables set by an HCP Terraform workspace.)