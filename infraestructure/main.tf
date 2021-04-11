module "network" {
    source = "../modules/infra/network/"
    cidr_block = var.cidr_block
    cidr_block_subnet = var.cidr_block_subnet
    cluster_name = var.cluster_name
}

module "cluster" {
    source = "./cluster/"
    cluster_name = var.cluster_name
    vpc_id = module.network.vpc_ip
    subnet_id = module.network.subnet_id
    vpc_cidr_blocks = module.network.vpc_cidr_blocks
}

module "worker-nodes" {
    source = "./worker-nodes/"
    cluster_name = var.cluster_name
    subnet_id = module.network.subnet_id
    instance_types = var.instance_types
    scaling_desired = var.scaling_desired
    scaling_min = var.scaling_min
    scaling_max = var.scaling_max
    cluster_name_resource = module.cluster.cluster_name_resource
}