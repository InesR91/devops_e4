provider "aws" {
  region = "us-east-2"
}

module "state" {
  source = "git::https://github.com/InesR91/devops_e4.git//devops_base/td5/scripts/tofu/modules/state-bucket?ref=main"

  name = "devops-tofu-inesr-20251114"
}
