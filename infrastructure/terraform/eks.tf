module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name    = "devscale-cluster"
  cluster_version = "1.29"

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  enable_cluster_creator_admin_permissions = true

  # Cluster endpoint settings
  cluster_endpoint_public_access  = true
  cluster_endpoint_private_access = true
  cluster_endpoint_public_access_cidrs = ["0.0.0.0/0"]

  eks_managed_node_groups = {
    devscale_nodes = {

      instance_types = ["t3.small"]   # Small but still cheap
      capacity_type  = "ON_DEMAND"

      min_size     = 3
      desired_size = 3
      max_size     = 5

      disk_size = 20
    }
  }

  tags = {
    Environment = "devscale"
    Project     = "DevScale Platform"
  }
}