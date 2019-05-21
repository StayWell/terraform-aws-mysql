resource "aws_rds_cluster" "this" {
  cluster_identifier_prefix       = "${var.env}-"
  final_snapshot_identifier       = "${var.env}-final"
  engine                          = "aurora"
  engine_mode                     = "serverless"
  engine_version                  = "${var.engine_version}"
  availability_zones              = ["${var.availability_zones}"]
  master_username                 = "${var.master_username}"
  master_password                 = "${random_string.this.result}"
  backup_retention_period         = "${var.backup_retention_period}"
  vpc_security_group_ids          = ["${aws_security_group.this.id}"]
  db_subnet_group_name            = "${aws_db_subnet_group.this.id}"
  db_cluster_parameter_group_name = "${aws_rds_cluster_parameter_group.this.id}"
  deletion_protection             = "${var.deletion_protection}"
  tags                            = "${merge(map("Name", "${var.env}"), var.tags)}"

  scaling_configuration {
    auto_pause   = "${var.auto_pause}"
    max_capacity = "${var.max_capacity}"
    min_capacity = "${var.min_capacity}"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_db_subnet_group" "this" {
  name_prefix = "${var.env}-"
  subnet_ids  = ["${var.subnet_ids}"]
  tags        = "${merge(map("Name", "${var.env}"), var.tags)}"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_rds_cluster_parameter_group" "this" {
  name_prefix = "${var.env}-"
  family      = "${var.family}"
  tags        = "${merge(map("Name", "${var.env}"), var.tags)}"

  parameter {
    name         = "lower_case_table_names"
    value        = "1"
    apply_method = "pending-reboot"
  }

  parameter {
    name         = "slow_query_log"
    value        = "1"
    apply_method = "pending-reboot"
  }

  parameter {
    name         = "general_log"
    value        = "1"
    apply_method = "pending-reboot"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "random_string" "this" {
  length = 32

  # rds cluster password policy: Only printable ASCII characters besides '/', '@', '"', ' ' may be used.
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "aws_security_group" "this" {
  name_prefix = "${var.env}-mysql-"
  vpc_id      = "${var.vpc_id}"
  tags        = "${merge(map("Name", "${var.env}-mysql"), var.tags)}"

  lifecycle {
    create_before_destroy = true
  }
}
