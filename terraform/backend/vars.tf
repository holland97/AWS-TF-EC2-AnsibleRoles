variable "dynamodb" {
  description = "Dynamodb table name"
  type        = string
  default     = "reh-project-dbtable"
}

variable "s3bkt" {
  description = "S3 bucket name"
  type        = string
  default     = "reh-project-bkt"
}