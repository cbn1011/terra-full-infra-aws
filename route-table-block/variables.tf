variable "project" {
  type = string
  default = "Bestdoc-UAE"
}
variable "vpcid" {
  type = string
}
variable "cidr" {
  default = "0.0.0.0/0"
}
variable "cidripv6" {
  default = "::/0"
}
variable "gateway" {
  type = string
}
variable "gateway-priv" {
  type = string
}
variable "subnet_association-priv" {
  type = list(string)
  default = ["190.160.1.0/24","190.160.2.0/24","190.160.3.0/24"]
}
variable "subnet_association-pub" {
  type = list(string)
  default = ["190.160.4.0/24","190.160.5.0/24","190.160.6.0/24"]
}
