module "vpc" {
  # source      = "../Terraform-vpc-module"
  source = "git::https://github.com/Sivasankar491/Terraform-vpc-module.git?ref=main"
  project     = var.project_name
  environment = var.environment_name
  common_tags = var.common_tags
  public_subnet_cidrs = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  database_subnet_cidrs = var.database_subnet_cidrs
  is_peering_required = true
}