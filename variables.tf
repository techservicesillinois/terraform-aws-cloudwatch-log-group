variable "disable_subscription_filter" {
  description = "Disable default subscription filter"
  default     = false
}

# Use cloudwatch_to_splunk lambda function by default.
variable "function_name" {
  description = "Name of the lambda function to be invoked by the filter"
  default     = "cloudwatch-to-splunk"
}

variable "filter_pattern" {
  description = "A valid CloudWatch filter pattern for subscribing to a filtered stream of log events (default is \"\" to match all messages)"
  default     = ""
}

variable "name" {
  description = "Log group name"
}

variable "retention" {
  description = "Log retention period in days"
  type        = number
  default     = 30
}

variable "tags" {
  description = "A map of tags for the resource"
  type        = map(string)
  default     = {}
}
