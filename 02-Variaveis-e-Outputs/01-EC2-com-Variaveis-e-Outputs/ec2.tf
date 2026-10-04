resource "aws_vpc" "my_vpc" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_support   = var.is_instance_open
  enable_dns_hostnames = var.is_instance_open

  tags = local.common_tags
}

resource "aws_subnet" "my_subnet" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = var.subnet_cidr_block

  tags = local.common_tags
}

resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my_vpc.id

  tags = local.common_tags
}

resource "aws_route_table" "my_route_table" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = var.cidr_ipv4
    gateway_id = aws_internet_gateway.my_igw.id
  }

  tags = local.common_tags
}

resource "aws_route_table_association" "my_subnet_association" {
  subnet_id      = aws_subnet.my_subnet.id
  route_table_id = aws_route_table.my_route_table.id
}

resource "aws_security_group" "my_instance_security_group" {
  name   = var.security_group_name
  vpc_id = aws_vpc.my_vpc.id

  tags = local.common_tags
}

resource "aws_vpc_security_group_ingress_rule" "my_security_group_rule" {
  security_group_id = aws_security_group.my_instance_security_group.id
  cidr_ipv4         = var.cidr_ipv4
  ip_protocol       = var.ip_protocol
  to_port           = var.port
  from_port         = var.port

  tags = local.common_tags
}

resource "aws_instance" "my_instance" {
  vpc_security_group_ids = [aws_security_group.my_instance_security_group.id]
  subnet_id              = aws_subnet.my_subnet.id

  ami                         = var.ami
  instance_type               = var.instance_type
  key_name                    = var.key_name
  associate_public_ip_address = var.is_instance_open

  tags = local.common_tags
}