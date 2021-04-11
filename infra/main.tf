module "network" {
    source = "../modules/infra/network/"
    cidr_block = var.cidr_block
    cidr_block_subnet = var.cidr_block_subnet
    cluster_name = var.cluster_name
}

#module "eks" {
#    source = "../modules/infra/eks/"
#    cluster_name = var.cluster_name
#    vpc_id = module.network.vpc_ip
#    subnet_id = module.network.subnet_id
#    vpc_cidr_blocks = module.network.vpc_cidr_blocks
#}