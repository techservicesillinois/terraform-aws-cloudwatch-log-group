locals {
  parameters = (var.disable_subscription_filter) ? {} : {
    "hec_endpoint" = {
      description = "Splunk HEC endpoint (cloudwatch-to-splunk for log group ${var.name})"
      type        = "String"
    }

    "hec_token" = {
      description = "Splunk HEC token (cloudwatch-to-splunk for log group ${var.name})"
      type        = "SecureString"
    }

    "sourcetype" = {
      description = "Splunk sourcetype (cloudwatch-to-splunk for log group ${var.name})"
      type        = "String"
    }
  }
}

# This code adapted from git@github.com:techservicesillinois/terraform-aws-ssm-parameter.

resource "aws_ssm_parameter" "default" {
  for_each    = local.parameters
  name        = format("/%s", join("/", compact(split("/", format("%s/%s/%s", var.prefix, var.name, each.key)))))
  type        = lookup(each.value, "type", "String")
  value       = lookup(each.value, "value", "*** NO VALUE SET ***")
  description = lookup(each.value, "description", "*** NO DESCRIPTION SET ***")
  tags        = var.tags

  lifecycle {
    # Never update the value of an existing SSM parameter.
    ignore_changes = [value]
    # Protect people from themselves.
    prevent_destroy = true
  }
}
