resource "aws_instance" "ec2" {
    ami = var.ami
    instance_type = var.ec2type
    subnet_id = aws_subnet.public-subnet.id
    security_groups = [aws_security_group.sg.id]
    key_name      = aws_key_pair.TF-key.key_name

    tags = {
      Name = "Project EC2"
    }
}

resource "aws_key_pair" "TF-key" {
  key_name   = "TF-key"
  public_key = tls_private_key.ed.public_key_openssh
}

resource "tls_private_key" "ed" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "TF-key" {
  content  = tls_private_key.ed.private_key_pem
  filename = "tfkey.pem"
}