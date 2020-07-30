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

variable "parameters" {
  description = "Parameters expressed as a map of maps. Each map's key is its intended SSM parameter name, and the value stored under that key is another map that may contain the following keys: description, type, and value. Default values are supplied for default cloudwatch-to-splunk lambda function"
  type        = map(map(string))
  default     = {}
}

variable "prefix" {
  description = "Prefix prepended to parameter name if not using default"
  default     = "/cloudwatch_to_splunk"
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
