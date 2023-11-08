locals {
  bastion_host_name = "${var.resource_prefix}-bastion"
}

data "aws_ssm_parameter" "this" {
  name = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}

resource "aws_instance" "this" {
  ami                         = data.aws_ssm_parameter.this.value
  instance_type               = var.instance_type
  key_name                    = var.key_name
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [aws_security_group.this.id]
  associate_public_ip_address = true
  disable_api_termination     = true
  ebs_optimized               = true
  metadata_options {
    http_tokens = "required"
  }

  tags = merge(var.tags, {
    Name = local.bastion_host_name
  })

}

resource "aws_security_group" "this" {
  description = "Security group for the bastion instance"
  name_prefix = local.bastion_host_name
  vpc_id      = var.vpc_id

  lifecycle {
    create_before_destroy = true
  }

  tags = var.tags
}

resource "aws_security_group_rule" "egress" {
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 0
  protocol          = "tcp"
  security_group_id = aws_security_group.this.id
  to_port           = 65535
  type              = "egress"

}

resource "aws_security_group_rule" "ingress" {
  cidr_blocks       = var.ssh_cidr_blocks
  description       = "SSH ingress from provided CIDR"
  from_port         = 22
  protocol          = "tcp"
  security_group_id = aws_security_group.this.id
  to_port           = 22
  type              = "ingress"

}

resource "aws_security_group_rule" "source" {
  description              = "SSH ingress from EKS nodes"
  from_port                = 22
  protocol                 = "tcp"
  security_group_id        = aws_security_group.this.id
  source_security_group_id = var.source_security_group_id
  to_port                  = 22
  type                     = "ingress"

}
