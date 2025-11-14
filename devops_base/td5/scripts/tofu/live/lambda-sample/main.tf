provider "aws" {
  region = "us-east-2"
}

module "function" {
  source = "git::https://github.com/InesR91/devops_e4.git//devops_base/td3/scripts/tofu/modules/lambda?ref=main"

  name = var.name

  src_dir = "${path.module}/src"
  runtime = "nodejs20.x"
  handler = "index.handler"

  memory_size = 128
  timeout     = 5

  environment_variables = {
    NODE_ENV = "production"
  }
}

module "gateway" {
  source = "git::https://github.com/InesR91/devops_e4.git//devops_base/td3/scripts/tofu/modules/api-gateway?ref=main"

  name = var.name
  function_arn       = module.function.function_arn
  api_gateway_routes = ["GET /"]
}
