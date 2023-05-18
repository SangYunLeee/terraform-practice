output "public_ip" {
  value       = aws_instance.backend.public_ip
  description = "The public IP of the Instance"
}

output "private_ip" {
  value       = aws_instance.backend.private_ip
  description = "The Private_ip of the Instance"
}

output "DB_private_ip" {
  value       = aws_db_instance.db.address
  description = "private_ip of the DB"
}

output "DB_id" {
  value       = aws_db_instance.db.id
  description = "id of the DB"
}
