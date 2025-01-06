variable "ingress_rules" {
  default = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      from_port   = 8080
      to_port     = 8080
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}

variable "instances_info" {
  type = map(object({
    ami_id        = string
    sg_ids        = list(string)
    instance_type = string
    tags          = map(string)
  }))
  default = {}
}

variable "mysql_ami_id" {
  type = string
}
variable "backend_ami_id" {
  type = string
}
variable "frontend_ami_id" {
  type = string
}

variable "mysql_instance_type" {
  type = string
}

variable "backend_instance_type" {
  type = string
}

variable "frontend_instance_type" {
  type = string
}

variable "common_tags" {
  type = map(string)
  default = {
    "Terraform" = "true"
    "project"   = "Expense"
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

variable "zone_id" {
  default = "Z081461419PCT70J0BCQ6"
}

variable "domain_name" {
  default = "devsecmlops.online"
}