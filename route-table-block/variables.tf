variable "project" {
  type = string
  default = "MyProject"
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
  type = string
}
variable "subnet_association-pub" {
  type = string
}