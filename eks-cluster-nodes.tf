module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = var.name
  cluster_version = "1.18"
  subnets         = module.vpc.private_subnets
  ### If your workstation is Windows
  # Download win-bash [https://sourceforge.net/projects/win-bash/]
  wait_for_cluster_interpreter = ["d:/Programas/shell/sh.exe", "-c"]
  wait_for_cluster_cmd         = "until curl -sk $ENDPOINT >/dev/null; do sleep 4; done"

  tags = {
    Environment = "challenge-pedro-verissimo"
    GithubRepo  = "devops"
    GithubOrg   = "naturacode"
  }

  vpc_id = module.vpc.vpc_id

  workers_group_defaults = {
    root_volume_type = "gp2"
  }

  worker_groups = [
    {
      name                          = "worker-g1"
      instance_type                 = "t2.small"
      additional_userdata           = "Small Server"
      asg_desired_capacity          = 2
      additional_security_group_ids = [aws_security_group.worker_group_mgmt.id]
    },
  ]
}

data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_id
}