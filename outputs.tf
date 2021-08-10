output "arn" {
  value = aws_cloudwatch_log_group.default.arn
}

output "lambda_function_arn" {
  value = var.disable_subscription_filter ? null : data.aws_lambda_function.selected[0].qualified_arn
}
