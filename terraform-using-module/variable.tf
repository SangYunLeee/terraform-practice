variable "backend_sg_name" {
  description = "SG for backend"
  type        = string
  default     = "SG_backend"
}

variable "db_sg_name" {
  description = "SG for DB"
  type        = string
  default     = "SG_SQL_DB"
}
