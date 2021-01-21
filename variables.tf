variable "ami" {
  description = "The base Windows Server AMI.  When not specified latests Windows Server 2019 AMI will be used."
  type        = string
  default     = ""

  validation {
    condition     = var.ami == "" || can(regex("^ami-", var.ami))
    error_message = "Please provide a valid ami id, starting with \"ami-\". or leave blank for latest Windows Server 2019 AMI."
  }
}

variable "vpc_id" {
  description = "AWS VPC ID"
  type        = string

  validation {
    condition     = can(regex("^vpc-", var.vpc_id))
    error_message = "Please provide a valid vpc id, starting with \"vpc-\"."
  }
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

  validation {
    condition     = can(regex("^subnet-", var.subnet_id))
    error_message = "Please provide a valid subnet id, starting with \"subnet-\"."
  }
}

variable "ingress_cidr_blocks" {
  description = "List of management interface ingress IPv4/IPv6 CIDR ranges."
  type        = list(string)
}

variable "key_name" {
  description = "AWS SSH key name to assign to the instance."
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

variable "stc_installer" {
  description = "File path to 'Spirent TestCenter Application x64.exe' or 'Spirent TestCenter Application.exe' installer."
  type        = string

  validation {
    condition = (
      can(regex("Spirent TestCenter Application( x64|)\\.exe", basename(var.stc_installer)))
    )
    error_message = "Spirent TestCenter Application x64.exe or Spirent TestCenter Application.exe must be specified in the path."
  }

}

variable "dest_dir" {
  description = "Destination directory on the instance where files will be copied"
  type        = string
  default     = "c:/users/administrator/downloads"
}
