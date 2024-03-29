resource "aws_docdb_cluster" "docdb" {
  cluster_identifier      = "${var.business_divsion}-${var.environment}-${var.document_db_cluster_name}"
  engine                  = var.document_db_engine
  master_username         = var.document_db_master_username
  master_password         = var.document_db_master_password
}