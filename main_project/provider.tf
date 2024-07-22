#provider.tf -> To indicate the cloud provider to terraform
provider "aws" {
  region     = "ap-northeast-1"
  access_key = "your_access_id"
  secret_key = "your_secret_key"
}

#add to $provider.tf -> VPC Creation
resource "aws_vpc" "main" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name        = "main-terraform-${terraform.workspace}"
    CostCenter  = "KHPAP-09876"
    Banglore    = "Banglore"
    Client      = "JPMorgan"
    Environment = terraform.workspace
    AccountId   = data.aws_caller_identity.current.account_id
  }
}
