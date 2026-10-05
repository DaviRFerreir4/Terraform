resource "aws_key_pair" "aws_key" {
  key_name   = "aws-key"
  public_key = file("./aws-key.pub")
}

resource "aws_security_group" "nginx_security_group" {
  name        = "nginx-security-group"
  description = "Permitir acesso na porta 80"
  vpc_id      = "vpc-011f8dcbacdd64402"

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "nginx-security-group"
  }
}

resource "aws_instance" "instance" {
  ami                         = "ami-077619b324deb97b0"
  instance_type               = "t3.micro"
  key_name                    = aws_key_pair.aws_key.key_name
  subnet_id                   = data.terraform_remote_state.vpc.outputs.subnet_id
  vpc_security_group_ids      = [
    data.terraform_remote_state.vpc.outputs.security_group_id,
    aws_security_group.nginx_security_group.id
  ]
  associate_public_ip_address = true

  user_data = file("./docs/docker.sh")

  tags = {
    Name = "terraform-instance"
  }
}