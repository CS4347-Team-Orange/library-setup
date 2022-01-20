output "ecs_cluster_arn" { 
    value = aws_ecs_cluster.this.id
}

output "vpc_id" { 
    value = module.vpc.vpc_id
}

output "vpc_arn" { 
    value = module.vpc.vpc_arn
}

output "vpc_public_subnets" { 
    value = module.vpc.public_subnets
}

output "vpc_private_subnets" { 
    value = module.vpc.private_subnets
}