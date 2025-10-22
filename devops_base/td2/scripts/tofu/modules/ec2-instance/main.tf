provider "aws" {
  region = "us-east-2"
}

resource "aws_security_group" "sample_app" {
  name        = var.name
  description = "Allow traffic into the sample app"
}

resource "aws_security_group_rule" "allow_inbound" {
  type              = "ingress"
  protocol          = "tcp"
  from_port         = var.port
  to_port           = var.port
  security_group_id = aws_security_group.sample_app.id
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "allow_all_outbound" {
  type              = "egress"
  protocol          = "-1"
  from_port         = 0
  to_port           = 0
  security_group_id = aws_security_group.sample_app.id
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_instance" "sample_app" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.sample_app.id]
  associate_public_ip_address = true
  user_data              = file("${path.module}/user-data.sh")

  tags = {
    Name = var.name
  }
}
