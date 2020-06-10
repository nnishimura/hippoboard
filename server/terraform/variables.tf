## Common
variable "profile" {
  default = "terraformer"
}

variable "region" {
  default = "ap-northeast-1"
}

variable "app_name" {
  default = "www.hippoboard.work"
}

## EC2
variable "ami" {
  default = "ami-0f310fced6141e627"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "public_key_path" {
  default = "~/.ssh/hippoboard_rsa.pub"
}

## Route53
## Reusing existing zone
variable "zone_id" {
  default = "Z0026843AO1RRE3VVSTC"
}
