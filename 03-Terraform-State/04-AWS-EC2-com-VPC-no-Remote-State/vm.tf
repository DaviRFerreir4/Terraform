resource "aws_key_pair" "aws_key" {
  key_name   = "aws-key"
  public_key = file("./aws-key.pub")
}

resource "aws_instance" "instance" {
  ami                         = "ami-077619b324deb97b0"
  instance_type               = "t3.micro"
  key_name                    = aws_key_pair.aws_key.key_name
  subnet_id                   = data.terraform_remote_state.vpc.outputs.subnet_id
  vpc_security_group_ids      = [data.terraform_remote_state.vpc.outputs.security_group_id]
  associate_public_ip_address = true

  tags = {
    Name = "terraform-instance"
  }
}