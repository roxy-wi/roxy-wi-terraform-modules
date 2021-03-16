resource "aws_instance" "hapwi" {
  ami                         = data.aws_ami.search.id
  instance_type               = var.instance_type
  vpc_security_group_ids      = var.firewall == true ? [aws_security_group.hapwi[0].id] : null
  associate_public_ip_address = var.public_ip
  key_name                    = var.ssh_key_name

  root_block_device {
    delete_on_termination = var.delete_on_termination
    volume_size           = var.volume_size
    volume_type           = var.volume_type
  }
  tags = {
    Name = var.name
  }
}
resource "aws_eip" "floating_ip" {
  count     = var.floating_ip == true ? 1 : 0
  instance  = aws_instance.hapwi.id
  vpc       = true
}