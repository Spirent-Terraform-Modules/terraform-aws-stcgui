output "id" {
  description = "List of IDs of instances"
  value       = aws_instance.stc_gui.*.id
}

output "public_ip" {
  description = "List of public IP addresses assigned to the instances, if applicable"
  value       = aws_instance.stc_gui.*.public_ip
}

output "private_ip" {
  description = "List of private IP addresses assigned to the instances, if applicable"
  value       = aws_instance.stc_gui.*.private_ip
}

