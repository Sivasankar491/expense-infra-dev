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

variable "backend_tags" {
    default = {
        Component = "backend"
    }
}