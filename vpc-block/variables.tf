variable "region"{
	default     = "me-central-1"
	description = "Default Region"
}
variable "vpcidr" {
	default     = "172.16.0.0/16"
	description = "Cidr value for the VPC"
}
#For Private Subnets
variable "subcidr-priv" {
	type        = list
	default     = ["172.16.32.0/19","172.16.64.0/19","172.16.96.0/19"]
	description = "Cidr value for subnets"
	sensitive   = true
}
#For pub subnet
variable "subcidr-pub" {
    type        = list
	default     = ["172.16.128.0/19","172.16.160.0/19","172.16.192.0/19"]
	description = "Cidr value for subnets"
}
data "aws_availability_zones" "az" {}
variable "project" {
    type        = string
    default     = "Bestdoc-Uae"
}
