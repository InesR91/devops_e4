provider "aws" {
  region = "us-east-2"
}

module "oidc_provider" {
  source = "git::https://github.com/InesR91/devops_e4.git//devops_base/td5/scripts/tofu/modules/github-aws-oidc?ref=main"

  provider_url = "https://token.actions.githubusercontent.com" 

}

module "iam_roles" {
  source = "git::https://github.com/InesR91/devops_e4.git//devops_base/td5/scripts/tofu/modules/gh-actions-iam-roles?ref=main"

  name              = "lambda-sample"                           
  oidc_provider_arn = module.oidc_provider.oidc_provider_arn    

  enable_iam_role_for_testing = true                            

  # TODO: fill in your own repo name here!
  github_repo      = "InesR91/devops_e4" 
  lambda_base_name = "lambda-sample"                            

  enable_iam_role_for_plan  = true                                
  enable_iam_role_for_apply = true                                

  # TODO: fill in your own bucket and table name here!
  tofu_state_bucket         = "devops-tofu-inesr-20251114" 
  tofu_state_dynamodb_table = "devops-tofu-inesr-20251114" 

}
