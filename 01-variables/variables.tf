variable "sg_name" {
  type = string
  default = "allow_ssh"
}

variable "ami_id" {
  type = string
  default = "ami-09c813fb71547fc4f"
}

variable "ingress_from_port" {
  type = number
  default = 22
}
variable "ingress_to_port" {
  type = number
  default = 22
}

variable "ingress_cidr_blocks" {
  type = list(string)
  default = [ "0.0.0.0/0" ]
}

variable "sg_tags" {
  type = map(string)
  default = {
    "Name" = "allow-ssh"
  }
}

variable "ec2_tags" {
  type = map(string)
  default = {
    "Name" = "ec2-vars"
  }
}

variable "instance_type" {
  default = "t3.micro"
}