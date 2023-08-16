module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 19.0"

  cluster_name    = "Devil-cluster"
  cluster_version = "1.27"

  cluster_endpoint_public_access  = true

  cluster_addons = {
    coredns = {
      most_recent = false
    }
    kube-proxy = {
      most_recent = false
    }
    vpc-cni = {
      most_recent = false
    }
  }

  vpc_id                         = module.vpc.vpc_id
  subnet_ids                     = module.vpc.private_subnets

  eks_managed_node_group_defaults = {
    instance_types = ["t3.small"]
  }

  eks_managed_node_groups = {
    blue = {
      min_size     = 2
      max_size     = 4
      desired_size = 2

      instance_types = ["t3.small"]
      capacity_type  = "SPOT"
    }
    green = {
      min_size     = 2
      max_size     = 4
      desired_size = 2

      instance_types = ["t3.small"]
      capacity_type  = "SPOT"
    }
  }

# create_aws_auth_configmap = true
manage_aws_auth_configmap = true

  # aws_auth_roles = [
  #   {
  #     rolearn  = "arn:aws:iam::102057119514:user/mad-dev"
  #     username = "mad-dev"
  #     groups   = ["system:masters"]
  #   },
  # ]

  aws_auth_users = [
    {
      userarn  = "arn:aws:iam::102057119514:user/mad-dev"
      username = "mad-dev"
      groups   = ["system:masters"]
    },
    # {
    #   userarn  = "arn:aws:iam::66666666666:user/user2"
    #   username = "user2"
    #   groups   = ["system:masters"]
    # },
  ]

  aws_auth_accounts = [
    "102057119514",
  ]

  tags = {
    Environment = "dev"
    Terraform   = "true"
  }
}