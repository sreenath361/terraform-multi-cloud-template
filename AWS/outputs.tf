# VPC ID
output vpc_id {
    value = module.Bosch-VPC.vpc_id
}

# All Public Subnets
output all_public_subnets {
    value = module.Bosch-VPC.all_public_subnets
}

# All Private Subnets
output all_private_subnets {
    value = module.Bosch-VPC.all_private_subnets
}

# SG ID
output sg_id {
    value = module.Bosch-VPC.sg_id
}

#Environment
output env {
    value = module.Bosch-VPC.env
}

# EC2 insance IDs
output instance_id {
value = module.Launch-EC2.instance_id
}

#EC2 Instance Public_DNS
output public_dns {
value = module.Launch-EC2.public_dns
}
