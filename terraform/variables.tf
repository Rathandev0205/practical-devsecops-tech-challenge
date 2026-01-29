variable "region" {
  default = "ap-south-1"
}

variable "instance_type" {
  default = "t3.micro"
}

variable "key_name" {
  description = "Existing AWS key pair"
  default     = "practical_devsecops_key"
}

variable "allowed_ssh_cidr" {
  description = "Your IP"
  default     = "27.7.108.125/32"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "region_zone" {
  description = "Availability zone for the instances"
  default     = "ap-south-1a"
}

variable "subnet_cidr" {
  description = "CIDR block for the subnet"
  default     = "10.0.1.0/24"
}

variable "instance_count" {
  description = "Number of Docker nodes to create"
  default     = 2

}