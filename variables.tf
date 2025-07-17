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