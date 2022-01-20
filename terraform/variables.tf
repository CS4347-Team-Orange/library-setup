variable "stage" { 
    description = "Stage of deployment, eg dev|qa|live"
    default     = "dev"
    type        = string
}

locals { 
    app_name = "library-${var.stage}"
}