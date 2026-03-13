terraform {
  backend "s3" {
    bucket         = "devscale-terraform-state"
    key            = "global/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "devscale-terraform-locks"
    encrypt        = true
  }
}