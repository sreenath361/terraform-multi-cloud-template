variable "vpc_cidr" {}
variable "vpc_name" {}
variable "IGW_name" {}
#variable "key_name" {}
variable "azs" {}
variable "publiccidrs" {}
variable "privatecidrs" {}
variable "environment" {}
variable "localsnew" {
default = {
    country = "India"
    }
}
