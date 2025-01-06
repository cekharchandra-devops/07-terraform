variable "ami_id" {
  default = "ami-09c813fb71547fc4f"
}

variable "instances" {
  type = list(string)
  default = [ "mysql","backend","frontend"]
}

variable "instances_info" {
 type = map(object({
   instance_type = string
   vpc_security_group_ids = list(string)
   ami_id = string
   tags = map(string)
 }))
 default = {
 }
}

variable "common_tags" {
  type = map(string)
  default = {
    "Terraform" = "true"
    "project" = "Expense"
  }
}

variable "mysql_tags" {
  type = map(string)
  default = {
    "Name" = "mysql"
  }
}

variable "backend_tags" {
  type = map(string)
  default = {
    "Name" = "backend"
  }
}

variable "frontend_tags" {
  type = map(string)
  default = {
    "Name" = "frontend"
  }
}

variable "mysql_instance_type" {
  type = string
}
variable "frontend_instance_type" {
  type = string
}
variable "backend_instance_type" {
  type = string
}

variable "ingress_rules" {
  type = list
  default = [
    {
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = [ "0.0.0.0/0" ]
    },
    {
      from_port = 8080
      to_port = 8080
      protocol = "tcp"
      cidr_blocks = [ "0.0.0.0/0" ]
    },
    {
      from_port = 80
      to_port = 80
      protocol = "tcp"
      cidr_blocks = [ "0.0.0.0/0" ]
    }
  ]
}