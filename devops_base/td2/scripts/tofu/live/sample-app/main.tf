provider "aws" {
region = "us-east-2"
}
variable "ami_id" {
  description = "The ID of the AMI to run."
  type        = string
}
module "sample_app_1" {
source = "../../modules/ec2-instance"
ami_id = var.ami_id # Replace with your AMI ID
name = "sample-app-tofu-1"
}
module "sample_app_2" {
source = "../../modules/ec2-instance"
ami_id = var.ami_id # Replace with your AMI ID
name = "sample-app-tofu-2"
}

locals {
  instances = [
    { name = "sample-app-tofu-1", port = 8080 },
    { name = "sample-app-tofu-2", port = 8080 },
  ]
}

module "sample_app" {
    source = "https://github.com/InesR91/devops_e4.git"
    ami_id = "ami-0e3b0cc0e0cb76872" # Replace with your AMI ID
    name = "sample-app-from-github"
}

