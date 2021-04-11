module "infra" {
    source = "./infra/"
    cidr_block = var.cidr_block
    cidr_block_subnet = var.cidr_block_subnet
    cluster_name = var.cluster_name
}