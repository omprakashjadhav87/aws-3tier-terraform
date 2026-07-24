variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet1_cidr" {
  type    = string
  default = "10.0.1.0/24"
}

variable "subnet2_cidr" {
  type    = string
  default = "10.0.2.0/24"
}

variable "subnet3_cidr" {
  type    = string
  default = "10.0.3.0/24"
}

variable "subnet4_cidr" {
  type    = string
  default = "10.0.4.0/24"
}

variable "subnet5_cidr" {
  type    = string
  default = "10.0.5.0/24"
}

variable "subnet6_cidr" {
  type    = string
  default = "10.0.6.0/24"
}