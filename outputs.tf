output "rds_db_endpoint" {
  value = aws_db_instance.default.endpoint
}

output "rds_db_name" {
  value = aws_db_instance.default.db_name
}

output "rds_db_port" {
  value = aws_db_instance.default.port
}