variable "stage" { 
    description = "Stage of deployment, eg dev|qa|live"
    default     = "dev"
    type        = string
}

variable "vpc_prefix" { 
    description = "The first two octets of the VPC CIDR"
    default     = "10.99"
    type        = string
}

locals { 
    app_name = "library-${var.stage}"
}