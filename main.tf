data "aws_eks_cluster" "cluster" {
  name = module.terraform-eks-demo.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.terraform-eks-demo.cluster_id
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
  token                  = data.aws_eks_cluster_auth.cluster.token

  exec {
    api_version = "client.authentication.k8s.io/v1alpha1"
    args        = ["token", "--cluster-id", module.terraform-eks-demo.cluster_id]
    command     = "aws-iam-authenticator"
  }
}

module "terraform-eks-demo" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = "terraform-eks-demo"
  cluster_version = "1.17"
  subnets         = ["subnet-0eda1246", "subnet-974798f1", "subnet-3d135a65"]
  vpc_id          = "vpc-17728571"
  manage_aws_auth = false

  worker_groups = [
    {
      instance_type = "t2.micro"
      asg_max_size  = 2
    }
  ]
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
 region = var.aws_region
}