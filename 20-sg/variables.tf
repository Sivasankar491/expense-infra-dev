variable "project" {
    default = "expense" 
}

variable "environment" {
    default = "dev" 
}

variable "mysql_sg_name" {
    default = "mysql"
}

variable "backend_sg_name" {
    default = "backend"
}

variable "frontend_sg_name" {
    default = "frontend"
}

variable "bastion_sg_name" {
    default = "bastian"
}

variable "ansible_sg_name" {
    default = "Ansible"
}

variable "app_alb_sg_name" {
    default = "App-alb"
}

variable "vpn_sg_name" {
    default = "VPN"
}


variable "common_tags" {
    default = {
        Environment = "Dev"
        project = "Expense"
    }
}

variable "mysql_sg_tags" {
    default = {
        Component = "MySQL"
    }
}

variable "backend_sg_tags" {
    default = {
        Component = "Backend"
    }
}

variable "frontend_sg_tags" {
    default = {
        Component = "Frontend"
    }
}

variable "bastion_sg_tags" {
    default = {
        Component = "Bastion"
    }
}

variable "ansible_sg_tags" {
    default = {
        Component = "Ansible"
    }
}

variable "app_alb_sg_tags" {
    default = {
        Component = "App-alb"
    }
}

variable "vpn_sg_tags" {
    default = {
        Component = "VPN"
    }
}