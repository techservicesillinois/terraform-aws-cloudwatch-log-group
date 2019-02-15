resource "aws_cloudwatch_log_group" "default" {
  name              = "${var.name}"
  retention_in_days = "${var.retention}"
  tags              = "${var.tags}"
}
