provider "aws" {
    region = var.region
}
resource "aws_ecs_cluster" "ecs-cluster" {
  name = var.cluster-name
  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}

resource "aws_ecs_cluster_capacity_providers" "ecs-capacity" {
  cluster_name = var.cluster-name

  capacity_providers = ["FARGATE"]

  default_capacity_provider_strategy {
    base              = 1
    weight            = 100
    capacity_provider = "FARGATE"
  }
  depends_on = [ aws_ecs_cluster.ecs-cluster ]
}
module "alb" {
  source = "./lb-block"
}
