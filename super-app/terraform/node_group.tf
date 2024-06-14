# Define EKS Node Group
module "eks_node_group" {
  source = "terraform-aws-modules/eks/aws//modules/node_group"
  cluster_name = module.eks_cluster.cluster_id
  node_group_name = "my-node-group"
  node_group_desired_capacity = 2 # Specify desired capacity of worker nodes
  node_group_min_size = 1 # Specify minimum size of worker nodes
  node_group_max_size = 3 # Specify maximum size of worker nodes
  node_group_instance_type = "t3.medium" # Specify instance type for worker nodes
  node_group_volume_size = 20 # Specify volume size for worker nodes
  node_group_key_name = "my-key-pair" # Specify SSH key pair for worker nodes
  node_group_subnet_ids = aws_subnet.subnet_ids
  node_group_security_group_ids = [aws_security_group.allow_all.id]
  tags = {
    Environment = "production"
  }
}

