## Locking Provider to specific AWS Account and Region
provider "aws" {
  region              = "us-east-1"
  allowed_account_ids = ["949767667488"]
}

## Backend to hold tf state and its lock, and locking terraform version to avoid any incosistencies
terraform {
  required_version = "0.14.4"
  backend "s3" {
    region         = "us-east-1"
    bucket         = "dev-siva-terraform-state"
    key            = "temp-conv.tfstate"
    dynamodb_table = "dev-siva-terraform-state-lock"
    encrypt        = true
  }
}
