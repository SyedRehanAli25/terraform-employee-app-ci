# Employee App ci Terraform backend.tf
terraform {
  backend "s3" {
    bucket = "my-terraform-state"
    key    = "employee-app-ci/terraform.tfstate"
    region = "us-east-1"
  }
}
