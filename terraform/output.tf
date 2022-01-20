output "ecs_cluster_arn" { 
    value = aws_ecs_cluster.this.id
}

output "ecs_cluster_name" { 
    value = local.app_name
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

output "cluster_security_group_arn" { 
    value = aws_security_group.this.arn
}

output "cluster_security_group_id" { 
    value = aws_security_group.this.id
}

output "sns_alerts_arn" { 
    value = aws_sns_topic.alerts.arn
}