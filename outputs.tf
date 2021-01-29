output "instance_ids" {
  description = "List of instance IDs"
  value       = aws_instance.stc_gui.*.id
}

output "instance_public_ips" {
  description = "List of public IP addresses assigned to the instances, if applicable"
  value       = aws_instance.stc_gui.*.public_ip
}

output "instance_private_ips" {
  description = "List of private IP addresses assigned to the instances, if applicable"
  value       = aws_instance.stc_gui.*.private_ip
}

output "instance_password_data" {
  description = "List of instance password data.  This allows additional provisioners to rsadecrypt the password."
  value       = aws_instance.stc_gui.*.password_data
  sensitive   = true
}
