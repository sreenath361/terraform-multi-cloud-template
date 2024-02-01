# VPC ID
output vpc_id {
value = aws_vpc.Bosch-Dev.id
}

# All Public Subnets
output all_public_subnets {
value = aws_subnet.Bosch-Dev-Public-Subnets.*.id
}

# All Private Subnets
output all_private_subnets {
value = aws_subnet.Bosch-Dev-Private-Subnets.*.id
}

# SG ID
output sg_id {
value = aws_security_group.Bosch-Dev-SG.id
}

# Environment
output env {
value = var.environment
}
