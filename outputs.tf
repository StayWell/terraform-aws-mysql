output "sg_id" {
  description = "https://www.terraform.io/docs/providers/aws/r/security_group.html#id"
  value       = "${aws_security_group.this.id}"
}

output "master_username" {
  description = "https://www.terraform.io/docs/providers/aws/r/rds_cluster.html#master_username-1"
  value       = "${aws_rds_cluster.this.master_username}"
}

output "master_password" {
  description = "https://www.terraform.io/docs/providers/aws/r/rds_cluster.html#master_password"
  value       = "${random_string.this.result}"
}

output "endpoint" {
  description = "https://www.terraform.io/docs/providers/aws/r/rds_cluster.html#endpoint"
  value       = "${aws_rds_cluster.this.endpoint}"
}

output "port" {
  description = "https://www.terraform.io/docs/providers/aws/r/rds_cluster.html#port-1"
  value       = "${aws_rds_cluster.this.port}"
}
