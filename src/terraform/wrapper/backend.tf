# Employee App ci Terraform backend.tf
terraform {
  backend "s3" {
    bucket = "wrap-terraform-state"
    key    = "employee-app-ci/terraform.tfstate"
    region = "ap-northeast-1"
  }
}
