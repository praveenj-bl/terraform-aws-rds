locals {
  # Replicas will use source metadata
  username       = var.replicate_source_db != null ? null : var.username
  password       = var.replicate_source_db != null ? null : var.password
  engine         = var.replicate_source_db != null ? null : var.engine
  engine_version = var.replicate_source_db != null ? null : var.engine_version
}


resource "aws_db_instance" "db_instance" {

  allocated_storage                   = var.allocated_storage
  engine                              = local.engine
  engine_version                      = local.engine_version
  instance_class                      = var.instance_class
  db_name                             = var.db_name
  username                            = var.username
  password                            = var.password
  iam_database_authentication_enabled = var.iam_database_authentication_enabled
  parameter_group_name                = "default.mysql5.7"
  skip_final_snapshot                 = true

}






