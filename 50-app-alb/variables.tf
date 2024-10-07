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

variable "zone_name" {
    default = "kotte.site"
}