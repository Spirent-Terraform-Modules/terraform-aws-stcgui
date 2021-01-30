provider "aws" {
  region = "us-west-2"
}

data "aws_vpc" "default" {
  tags = {
    ExampleName = "vpc1"
  }
}

data "aws_subnet" "mgmt_plane" {
  vpc_id = data.aws_vpc.default.id
  tags = {
    ExampleName = "mgmt_plane"
  }
}

data "aws_eip" "eip1" {
  tags = {
    ExampleName = "eip1"
  }
}

module "stc_gui" {
  source = "../.."

  vpc_id         = data.aws_vpc.default.id
  instance_count = 1

  subnet_id = data.aws_subnet.mgmt_plane.id
  eips      = [data.aws_eip.eip1.id]

  ingress_cidr_blocks = ["0.0.0.0/0"]
  key_name            = "spirent_ec2"
  private_key_file    = "~/.ssh/spirent_ec2"

  stc_installer = "../../install-files/Spirent TestCenter Application x64.exe"
}

output "instance_public_ips" {
  value = module.stc_gui.instance_public_ips
}
