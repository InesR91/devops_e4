variable "ami_id" {
  description = "The ID of the AMI to run."
  type        = string
}

variable "name" {
  description = "The base name for the instance and all other resources"
  type        = string
}

variable "instance_type" {
  description = "The EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "port" {
  description = "The port the instance should expose"
  type        = number
  default     = 8080
}