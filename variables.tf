variable "db_name" {
  description = "The name of the database to create"
  type        = string 
}

variable "db_engine" {
    description = "The database engine to use"
    type        = string
}
variable "db_engine_version" {
    description = "The version of the database engine to use"
    type        = string
}
variable "db_instance_class" {
    description = "The instance class for the database"
    type        = string
}
variable "db_username" {
    description = "The username for the database"
    type        = string
}
variable "db_password" {
    description = "The password for the database"
    type        = string
    sensitive   = true
}
variable "db_group_name" {
    description = "The database group name"
    type        = string
}

variable "db_subnet_group_name" {
    description = "The name of the DB subnet group"
    type        = string
    default     = "default"
  
}

variable "vpc_security_group_ids" {
    description = "List of security group IDs to associate with the DB instance"
    type        = list(string)
    default     = []
}
