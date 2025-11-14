terraform {
  backend "s3" {
    bucket         = "devops-tofu-inesr-20251114"
    key            = "td5/scripts/tofu/live/lambda-sample"
    region         = "us-east-2"
    encrypt        = true
    dynamodb_table = "devops-tofu-inesr-20251114"
  }
}
