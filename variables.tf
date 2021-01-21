variable "ami" {
  description = "The base Windows Server AMI.  When not specified latests Windows Server 2019 AMI will be used."
  type        = string
  default     = ""
}

variable "vpc_id" {
  description = "AWS VPC ID"
  type        = string
  default     = ""
}

variable "instance_name" {
  description = "Name assigned to the Windows STC GUI instance.  An instance number will be appended to the name."
  type        = string
  default     = "stcgui-"
}

variable "instance_count" {
  description = "Number of instances to create"
  type        = number
  default     = 1
}

variable "instance_type" {
  description = "AWS instance type"
  type        = string
  default     = "m5.large"
}

variable "subnet_id" {
  description = "Management public AWS subnet ID"
  type        = string
}

variable "ingress_cidr_blocks" {
  description = "List of management interface ingress IPv4/IPv6 CIDR ranges"
  type        = list(string)
}

variable "key_name" {
  description = "AWS SSH key name to assign to each instance"
  type        = string
}

variable "private_key_file" {
  description = "AWS key private file"
  type        = string
}

variable "enable_provisioner" {
  description = "Enable provisioning"
  type        = bool
  default     = true
}

variable "src_dir" {
  description = "Source directory containing 'Spirent TestCenter Application.exe'.  This directory will be copied to each instance."
  type        = string
}

variable "dest_dir" {
  description = "Destination directory on the instance where files will be copied"
  type        = string
  default     = "c:/users/administrator/downloads"
}
