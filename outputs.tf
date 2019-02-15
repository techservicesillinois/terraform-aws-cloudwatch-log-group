output "arn" {
  value = "${aws_cloudwatch_log_group.default.arn}"
}

output "lambda_function_arn" {
  value = "${data.aws_lambda_function.selected.qualified_arn}"
}
