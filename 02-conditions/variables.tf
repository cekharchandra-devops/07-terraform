variable "ami_id" {
  default = "ami-09c813fb71547fc4f"
}

variable "instances" {
  type = list(string)
  default = [ "mysql","backend","frontend"]
}