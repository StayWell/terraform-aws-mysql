variable "vpc_id" {
  description = "(optional) https://www.terraform.io/docs/providers/aws/r/security_group.html#vpc_id"
  default     = ""
}

variable "subnet_ids" {
  description = "(required) https://www.terraform.io/docs/providers/aws/r/db_subnet_group.html#subnet_ids"
  default     = []
}

variable "availability_zones" {
  description = "(required - plan will not be idempotent if empty) https://www.terraform.io/docs/providers/aws/r/rds_cluster.html#availability_zones"
  default     = []
}

variable "env" {
  description = "(optional) Unique identifier used to name all resources"
  default     = "default"
}

variable "tags" {
  description = "(optional) Additional tags applied to all resources"
  default     = {}
}

variable "engine_version" {
  description = "(optional) https://www.terraform.io/docs/providers/aws/r/rds_cluster.html#engine_version"
  default     = "5.6.10a"
}

variable "master_username" {
  description = "(optional) https://www.terraform.io/docs/providers/aws/r/rds_cluster.html#master_username"
  default     = "root"
}

variable "backup_retention_period" {
  description = "(optional) https://www.terraform.io/docs/providers/aws/r/rds_cluster.html#backup_retention_period"
  default     = "5"
}

variable "deletion_protection" {
  description = "(optional) https://www.terraform.io/docs/providers/aws/r/rds_cluster.html#deletion_protection"
  default     = "true"
}

variable "auto_pause" {
  description = "(optional) https://www.terraform.io/docs/providers/aws/r/rds_cluster.html#auto_pause"
  default     = "true"
}

variable "max_capacity" {
  description = "(optional) https://www.terraform.io/docs/providers/aws/r/rds_cluster.html#max_capacity"
  default     = "16"
}

variable "min_capacity" {
  description = "(optional) https://www.terraform.io/docs/providers/aws/r/rds_cluster.html#min_capacity"
  default     = "2"
}

variable "family" {
  description = "(optional) https://www.terraform.io/docs/providers/aws/r/rds_cluster_parameter_group.html#family"
  default     = "aurora5.6"
}

variable "snapshot_identifier" {
  description = "(optional) https://www.terraform.io/docs/providers/aws/r/rds_cluster.html#snapshot_identifier"
  default     = ""
}
