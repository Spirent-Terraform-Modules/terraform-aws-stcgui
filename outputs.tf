<<<<<<< 3f958f0e46ee2b589bbb7bf922479571036e609d
<<<<<<< 426c4039dc78350a633785844bfb17d52b32484f
=======
>>>>>>> chore: name and desc cleanup
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

<<<<<<< 3f958f0e46ee2b589bbb7bf922479571036e609d
=======
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

>>>>>>> feat: inital commit
=======
>>>>>>> chore: name and desc cleanup
