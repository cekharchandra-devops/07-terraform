locals {
  instances_info = {
    mysql = {
        instance_type = var.mysql_instance_type
        vpc_security_group_ids = [aws_security_group.allow_ssh.id]
        ami_id = var.ami_id
        tags = merge(
            var.common_tags,
            var.mysql_tags
        )
    }
    backend = {
        instance_type = var.backend_instance_type
        vpc_security_group_ids = [aws_security_group.allow_ssh.id]
        ami_id = var.ami_id
        tags = merge(
            var.common_tags,
            var.backend_tags
        )
    }
    frontend = {
        instance_type = var.frontend_instance_type
        vpc_security_group_ids = [aws_security_group.allow_ssh.id]
        ami_id = var.ami_id
        tags = merge(
            var.common_tags,
            var.frontend_tags
        )
    }
  }
}