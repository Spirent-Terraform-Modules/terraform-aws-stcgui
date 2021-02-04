variable "region" {
  description = "AWS region"
  default     = "us-west-2"
}

variable "vpc_id" {
  description = "VPC ID"
  default     = "vpc-123456789"
}

variable "subnet_id" {
  description = "Management plane subnet ID"
  default     = "subnet-123456789"
}

variable "instance_count" {
  description = "Number of instances to create"
  type        = number
  default     = 1
}

variable "key_name" {
  description = "AWS SSH key name to assign to each instance"
  default     = "bootstrap_key"
}

variable "private_key_file" {
  description = "AWS key private file"
  default     = "bootstrap_private_key_file"
}

variable "stc_installer" {
  description = "File path to 'Spirent TestCenter Application x64.exe' or 'Spirent TestCenter Application.exe' installer."
  default     = "../../Spirent TestCenter Application x64.exe"
}

variable "eips" {
  description = "List of instance Elastic IP IDs"
  default     = ["eipalloc-123456789"]
}


module "stc_gui" {
  source = "../.."

  vpc_id         = var.vpc_id
  instance_count = 1

  subnet_id = var.subnet_id
  eips      = var.eips

  # Warning: Using all address cidr block to simplify the example. You should limit instance access.
  ingress_cidr_blocks = ["0.0.0.0/0"]

  key_name         = var.key_name
  private_key_file = var.private_key_file
  stc_installer    = var.stc_installer
}

output "instance_public_ips" {
  description = "List of public IP addresses assigned to the instances, if applicable"
  value       = module.stc_gui.instance_public_ips
}
