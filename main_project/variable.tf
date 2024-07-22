variable "vpc_cidr" {
    default = "10.0.0.0/16"
    description = "choose cidr for your vpc"
    type = string
}
variable "web_ami" {
    default = "ami-013a28d7c2ea10269" 
    description = "choose ami for your vpc"
    type = string
}