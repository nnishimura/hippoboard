## Common
variable "profile" {
  default = "menta_tf"
}

variable "region" {
  default = "ap-northeast-1"
}

## EC2
variable "ami" {
  default = "ami-0f310fced6141e627"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "public_key_path" {
  default = "~/.ssh/menta_circleci.pub"
}

## Route53
## Reusing existing zone
variable "zone_id" {
  default = "Z0597982TW16OHE8DL8Y"
}
