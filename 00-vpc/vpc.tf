module "vpc" {
    #source = "../terraform-aws-vpc"
    source = "git::https://github.com/nirmalaMahadasyam/terraform-aws-vpc.git?ref=main"
    vpc_cidr = var.vpc_cidr
    project_name = var.project_name
    environment_name = var.environment_name
    common_tags = var.common_tags
    public_subnet_cidr = var.public_subnet_cidr
    private_subnet_cidr = var.private_subnet_cidr
    database_subnet_cidr = var.database_subnet_cidr
    is_peering_required = var.is_peering_required
}

