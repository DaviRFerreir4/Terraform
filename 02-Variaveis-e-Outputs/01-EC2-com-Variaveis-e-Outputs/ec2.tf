resource "aws_vpc" "my_vpc" {
  cidr_block = ""
  # "10.0.0.0/16"

  tags = ""
}

resource "aws_subnet" "my_subnet" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = ""
  # "10.0.1.0/24"

  tags = ""
}

resource "aws_security_group" "my_instance_security_group" {
  name   = ""
  vpc_id = aws_vpc.my_vpc.id

  tags = ""
}

resource "aws_vpc_security_group_ingress_rule" "my_security_group_rule" {
  security_group_id = aws_security_group.my_instance_security_group.id
  cidr_ipv4         = ""
  # "0.0.0.0/0"
  ip_protocol       = ""
  # "tcp"
  to_port           = ""
  from_port         = ""

  tags = ""
}

resource "aws_instance" "my_instance" {
  vpc_security_group_ids = [aws_security_group.my_instance_security_group.id]
  subnet_id = aws_subnet.my_subnet.id

  ami = ""
  instance_type = ""
  key_name = ""
  associate_public_ip_address = ""

  tags = ""
}