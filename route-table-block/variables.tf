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
