resource "aws_instance" "nginx-webserver" {
  ami                         = lookup(var.amis, var.aws_region)
  instance_type               = var.instance_type
  associate_public_ip_address = true # produce request output to refrence the "host" atrribute
  key_name                    = aws_key_pair.productionkey.key_name
  subnet_id                   = module.vpc.public_subnets[0]
  count                       = var.instance_count
  vpc_security_group_ids      = [aws_security_group.web_server_sg.id]

  tags = {
    Name    = "nginx-webserver"
    Project = "two-tier-architecture"
  }

  provisioner "file" {
    content     = templatefile("nginxscript.tmpl", { rds-endpoint = aws_db_instance.arch-rds.address, username = local.db_creds.username, password = local.db_creds.password })
    destination = "/tmp/nginxscript.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod 755 /tmp/nginxscript.sh",
      "/./tmp/nginxscript.sh",
    ]
  }

  connection {
    type        = "ssh"
    host        = self.public_ip
    user        = var.username
    private_key = file(var.priv_key_path)
    timeout     = "4m"
  }
  depends_on = [aws_db_instance.arch-rds]
}

