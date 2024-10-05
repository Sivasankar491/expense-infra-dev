variable "project" {
    default = "expense" 
}

variable "environment" {
    default = "dev" 
}

variable "common_tags" {
    default = {
        Environment = "Dev"
        project = "Expense"
    }
}

variable "rds_tags" {
    default = {
        Component = "RDS-mysql"
    }
}

variable "zone_name" {
    default = "kotte.site"
}

