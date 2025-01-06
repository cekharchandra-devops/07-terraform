locals {
  instances_info = {
    "mysql" = {
      ami_id        = var.mysql_ami_id
      sg_ids        = [aws_security_group.allow_sshh.id]
      instance_type = var.mysql_instance_type
      tags = merge(
        var.common_tags,
        var.mysql_tags
      )
    },
    "frontend" = {
      ami_id        = var.mysql_ami_id
      sg_ids        = [aws_security_group.allow_sshh.id]
      instance_type = var.frontend_instance_type
      tags = merge(
        var.common_tags,
        var.frontend_tags
      )
    },
    "backend" = {
      ami_id        = var.mysql_ami_id
      sg_ids        = [aws_security_group.allow_sshh.id]
      instance_type = var.backend_instance_type
      tags = merge(
        var.common_tags,
        var.backend_tags
      )
    }
  }
}
