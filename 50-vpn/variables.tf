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

variable "vpn_tags" {
    default = {
        Component = "VPN"
    }
}