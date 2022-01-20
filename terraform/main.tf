module "vpc" {
  source = "git::https://github.com/terraform-aws-modules/terraform-aws-vpc.git?ref=v3.3.0"

  name = local.app_name
  cidr = "${var.vpc_prefix}.0.0/16"
  // 10.0.0.0/8 is reserved for EC2-Classic

  azs                   = ["us-east-2a", "us-east-2b", "us-east-2c"]

  private_subnets           = ["${var.vpc_prefix}.0.0/19", "${var.vpc_prefix}.64.0/19", "${var.vpc_prefix}.128.0/19"]
  private_subnet_suffix     = "private"
  private_subnet_tags       = {
    Type  = "private"
  }


  public_subnets            = ["${var.vpc_prefix}.32.0/19", "${var.vpc_prefix}.96.0/19", "${var.vpc_prefix}.160.0/19"]
  public_subnet_suffix      = "public"
  public_subnet_tags       = {
    Type  = "public"
  }

  create_database_subnet_group = false

  manage_default_route_table = true
  default_route_table_tags   = { DefaultRouteTable = true }

  enable_dns_hostnames = true
  enable_dns_support   = true

  enable_classiclink             = false
  enable_classiclink_dns_support = false

  enable_nat_gateway     = true
  single_nat_gateway     = false
  one_nat_gateway_per_az = true

  enable_vpn_gateway = false

  enable_dhcp_options              = false

  # Default security group - ingress/egress rules cleared to deny all
  manage_default_security_group  = true
  default_security_group_ingress = []
  default_security_group_egress  = []

  # VPC Flow Logs (Cloudwatch log group and IAM role will be created)
  enable_flow_log                      = false
}

resource "aws_ecs_cluster" "this" { 
    name                 = local.app_name
    
    setting {
        name  = "containerInsights"
        value = "enabled"
    }
}

resource "aws_security_group" "this" { 
    name                 = "${local.app_name}-cluster"
    description          = "Cluster security group for ${local.app_name}"
    vpc_id               = module.vpc.vpc_id

    ingress {
        protocol  = "-1"
        from_port = 0
        to_port   = 0
        self      = true
    }
  
    egress {
        protocol  = "-1"
        from_port = 0
        to_port   = 0
        self      = true
    }
}
