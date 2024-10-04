module "mysql_sg" {
    # source = "../../Terraform-sg-module"
    source = "git::https://github.com/Sivasankar491/Terraform-sg-module.git?ref=main"
    project = var.project
    environment = var.environment
    sg_name = var.mysql_sg_name
    vpc_id = local.vpc_id
    common_tags = var.common_tags
    sg_tags = var.mysql_sg_tags
}

module "backend_sg" {
    # source = "../../Terraform-sg-module"
    source = "git::https://github.com/Sivasankar491/Terraform-sg-module.git?ref=main"
    project = var.project
    environment = var.environment
    sg_name = var.backend_sg_name
    vpc_id = local.vpc_id
    common_tags = var.common_tags
    sg_tags = var.backend_sg_tags
}

module "frontend_sg" {
    # source = "../../Terraform-sg-module"
    source = "git::https://github.com/Sivasankar491/Terraform-sg-module.git?ref=main"
    project = var.project
    environment = var.environment
    sg_name = var.frontend_sg_name
    vpc_id = local.vpc_id
    common_tags = var.common_tags
    sg_tags = var.frontend_sg_tags
}

module "bastion_sg" {
    # source = "../Terraform-sg-module"
    source = "git::https://github.com/Sivasankar491/Terraform-sg-module.git?ref=main"
    project = var.project
    environment = var.environment
    sg_name = var.bastion_sg_name
    vpc_id = local.vpc_id
    common_tags = var.common_tags
    sg_tags = var.bastion_sg_tags
}

module "ansible_sg" {
    # source = "../Terraform-sg-module"
    source = "git::https://github.com/Sivasankar491/Terraform-sg-module.git?ref=main"
    project = var.project
    environment = var.environment
    sg_name = var.ansible_sg_name
    vpc_id = local.vpc_id
    common_tags = var.common_tags
    sg_tags = var.ansible_sg_tags
}

resource "aws_security_group_rule" "mysql_backend" {
  type              = "ingress"
  from_port         = 3306
  to_port           = 3306
  protocol          = "tcp"
#   cidr_blocks       = [aws_vpc.example.cidr_block]
#   ipv6_cidr_blocks  = [aws_vpc.example.ipv6_cidr_block]
  source_security_group_id = module.backend_sg.id
  security_group_id = module.mysql_sg.id
}

resource "aws_security_group_rule" "backend_frontend" {
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
#   cidr_blocks       = [aws_vpc.example.cidr_block]
#   ipv6_cidr_blocks  = [aws_vpc.example.ipv6_cidr_block]
  source_security_group_id = module.frontend_sg.id
  security_group_id = module.backend_sg.id
}

resource "aws_security_group_rule" "frontend_public" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
#   ipv6_cidr_blocks  = [aws_vpc.example.ipv6_cidr_block]
#   source_security_group_id = module.frontend_sg.sg_id
  security_group_id = module.frontend_sg.id
}

resource "aws_security_group_rule" "mysql_bastion" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
#   cidr_blocks       = ["0.0.0.0/0"]
#   ipv6_cidr_blocks  = [aws_vpc.example.ipv6_cidr_block]
  source_security_group_id = module.bastion_sg.id
  security_group_id = module.mysql_sg.id
}

resource "aws_security_group_rule" "backend_bastion" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
#   cidr_blocks       = ["0.0.0.0/0"]
#   ipv6_cidr_blocks  = [aws_vpc.example.ipv6_cidr_block]
  source_security_group_id = module.bastion_sg.id
  security_group_id = module.backend_sg.id
}


resource "aws_security_group_rule" "frontend_bastian" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
#   cidr_blocks       = ["0.0.0.0/0"]
#   ipv6_cidr_blocks  = [aws_vpc.example.ipv6_cidr_block]
  source_security_group_id = module.bastion_sg.id
  security_group_id = module.frontend_sg.id
}


resource "aws_security_group_rule" "mysql_ansible" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
#   cidr_blocks       = ["0.0.0.0/0"]
#   ipv6_cidr_blocks  = [aws_vpc.example.ipv6_cidr_block]
  source_security_group_id = module.ansible_sg.id
  security_group_id = module.mysql_sg.id
}

resource "aws_security_group_rule" "backend_ansible" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
#   cidr_blocks       = ["0.0.0.0/0"]
#   ipv6_cidr_blocks  = [aws_vpc.example.ipv6_cidr_block]
  source_security_group_id = module.ansible_sg.id
  security_group_id = module.backend_sg.id
}


resource "aws_security_group_rule" "frontend_ansible" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
#   cidr_blocks       = ["0.0.0.0/0"]
#   ipv6_cidr_blocks  = [aws_vpc.example.ipv6_cidr_block]
  source_security_group_id = module.ansible_sg.id
  security_group_id = module.frontend_sg.id
}

resource "aws_security_group_rule" "ansible_public" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
#   ipv6_cidr_blocks  = [aws_vpc.example.ipv6_cidr_block]
#   source_security_group_id = module.frontend_sg.sg_id
  security_group_id = module.ansible_sg.id
}

resource "aws_security_group_rule" "bastion_public" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
#   ipv6_cidr_blocks  = [aws_vpc.example.ipv6_cidr_block]
#   source_security_group_id = module.frontend_sg.sg_id
  security_group_id = module.bastion_sg.id
}

