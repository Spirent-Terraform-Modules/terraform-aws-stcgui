
# find latest public Windows Server AMI
data "aws_ami" "windows_server" {
  owners           = ["amazon"]
  most_recent      = true
  executable_users = ["all"]

  filter {
    name   = "name"
    values = ["Windows_Server-2019-English-Full-Base*"]
  }

  filter {
    name   = "platform"
    values = ["windows"]
  }
}

resource "aws_security_group" "stc_gui" {
  name        = "stc_gui"
  description = "TestCenter Security Group"

  vpc_id = var.vpc_id

  # RDP
  ingress {
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = var.ingress_cidr_blocks
  }

  # SSH
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.ingress_cidr_blocks
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

data "template_file" "user_data" {
  template = file("${path.module}/user_data.tpl")
}

# create Windows TestCenter 
resource "aws_instance" "stc_gui" {
  count         = var.instance_count
  ami           = var.ami != "" ? var.ami : data.aws_ami.windows_server.id
  instance_type = var.instance_type
  key_name      = var.key_name
  subnet_id     = var.subnet_id

  vpc_security_group_ids = [aws_security_group.stc_gui.id]
  user_data              = data.template_file.user_data.rendered

  get_password_data = true

  tags = {
    Name = format("%s%d", var.instance_name, 1 + count.index)
  }
}

# provison the windows VM
resource "null_resource" "provisioner" {
  count = var.enable_provisioner ? var.instance_count : 0
  connection {
    host     = aws_instance.stc_gui[count.index].public_ip
    type     = "ssh"
    user     = "Administrator"
    password = rsadecrypt(aws_instance.stc_gui[count.index].password_data, file(var.private_key_file))
    # work around terraform bug #25634 windows server 2019 ssh server
    # set script_path
    script_path = "/Windows/Temp/terraform_%RAND%.bat"
  }

  # force provisioners to rerun
  # triggers = {
  #   always_run = "${timestamp()}"
  # }

  # copy install script
  provisioner "file" {
    source      = "${path.module}/install-testcenter.ps1"
    destination = "${var.dest_dir}/install-testcenter.ps1"
  }

  # copy Spirent TestCenter installer
  provisioner "file" {
    source      = var.src_dir
    destination = "${var.dest_dir}/install-files"
  }

  # run install
  provisioner "remote-exec" {
    inline = [
      "powershell -File \"${var.dest_dir}/install-testcenter.ps1\" -dir \"${var.dest_dir}/install-files\" -download 1",
    ]
  }
}
