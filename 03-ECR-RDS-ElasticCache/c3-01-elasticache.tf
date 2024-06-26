resource "aws_elasticache_subnet_group" "default" {
  name       = "elasticache-subnet"
  subnet_ids = concat(data.terraform_remote_state.eks.outputs.private_subnets.*, data.terraform_remote_state.eks.outputs.public_subnets.*)
}

resource "aws_elasticache_replication_group" "default" {
  replication_group_id          = "elasticache-cluster"
  description                   = "Redis cluster for My food"

  node_type            = "cache.t4g.micro"
  port                 = 6379
  parameter_group_name = "default.redis7.cluster.on"

  snapshot_retention_limit = 5
  snapshot_window          = "00:00-05:00"

  subnet_group_name          = "${aws_elasticache_subnet_group.default.name}"
  automatic_failover_enabled = true

  security_group_ids = [
    "sg-0147b5642f37b258c",
  ]

  replicas_per_node_group = 1
  num_node_groups         = 1

}
