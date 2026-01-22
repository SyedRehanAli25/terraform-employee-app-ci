# Employee App ci Terraform wrapper main.tf
module "employee_app" {
  source = "../../modules/employee-app-ci"
}
