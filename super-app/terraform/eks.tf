# Define IAM Role for EKS Service
resource "aws_iam_role" "eks_cluster_role" {
  name               = "eks_cluster_role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect    = "Allow",
      Principal = {
        Service = "eks.amazonaws.com"
      },
      Action    = "sts:AssumeRole"
    }]
  })
}

# Define EKS Cluster
module "eks_cluster" {
  source             = "terraform-aws-modules/eks/aws"
  cluster_name       = "my-cluster"
  cluster_version    = "1.21" # Specify your desired Kubernetes version
  subnets            = aws_subnet.subnet_ids
  vpc_id             = aws_vpc.main.id
  node_group_name    = "my-node-group"
  node_group_desired_capacity = 2 # Specify desired capacity of worker nodes
  node_group_min_size         = 1 # Specify minimum size of worker nodes
  node_group_max_size         = 3 # Specify maximum size of worker nodes
  node_group_instance_type    = "t3.medium" # Specify instance type for worker nodes
  node_group_volume_size      = 20 # Specify volume size for worker nodes
  node_group_key_name         = "my-key-pair" # Specify SSH key pair for worker nodes
  node_group_subnet_ids       = aws_subnet.subnet_ids
  node_group_security_group_ids = [aws_security_group.allow_all.id]
  tags = {
    Environment = "production"
  }
}

