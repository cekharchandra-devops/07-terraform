resource "aws_instance" "expense" {
  for_each               = local.instances_info
  ami                    = each.value.ami_id
  vpc_security_group_ids = each.value.sg_ids
  instance_type          = each.value.instance_type
  tags                   = each.value.tags
}

resource "aws_route53_record" "expense_records" {
  for_each = aws_instance.expense
  zone_id  = var.zone_id
  name     = each.key == "frontend" ? "${var.domain_name}" : "${each.key}.${var.domain_name}"
  type     = "A"
  ttl      = 1
  records  = each.key == "frontend" ? [each.value.public_ip] : [each.value.private_ip]
  allow_overwrite = true
}