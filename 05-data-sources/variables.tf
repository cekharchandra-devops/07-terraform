variable "ami_id" {
  default = "ami-09c813fb71547fc4f"
}

variable "instances" {
  type = list(string)
  default = [ "mysql","backend","frontend"]
}

variable "instances_info" {
  type = map(string)
  default = {
    "mysql" = "t3.small"
    "backend" = "t3.micro"
    "frontend" = "t3.micro"
  }
}