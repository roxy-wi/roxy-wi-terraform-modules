output "internal_ip" {
  value = aws_instance.hapwi.private_ip
}
output "public_ip" {
  value = var.public_ip ? aws_instance.hapwi.public_ip : null
}
output "elastic_ip" {
  value = var.floating_ip ? aws_eip.floating_ip[*].public_ip : null
}