# cloudwatch-log-group

[![Build Status](https://drone.techservices.illinois.edu/api/badges/techservicesillinois/terraform-aws-cloudwatch-log-group/status.svg)](https://drone.techservices.illinois.edu/techservicesillinois/terraform-aws-cloudwatch-log-group)

Provides a CloudWatch Log Group resource. By default a [subscription
filter](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs//Subscriptions.html)
is provided that forwards all of the log group's data to
the Lambda function
[cloudwatch-to-splunk](https://github.com/techservicesillinois/terraform-aws-cloudwatch-to-splunk).

Argument Reference
-----------------

The following arguments are supported:

* `name` - (Required) Log group name.

* `disable_subscription_filter` - (Optional) Disable default
subscription filter (Default false).

* `function_name` - (Optional) Name of the lambda function to be
invoked by the filter (Default cloudwatch-to-splunk).

* `filter_pattern` - (Optional) A valid CloudWatch
[filter pattern](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs//FilterAndPatternSyntax.html)
for subscribing to a filtered stream of log events (default is `.`
to match all messages)"

* `retention` - (Optional) Log retention period in days (Default 30).

* `tags` - (Optional) A map of tags for the resource.

Attributes Reference
--------------------

The following attributes are exported:

* `arn` - The Amazon Resource Name (ARN) specifying the log group.

* `lambda_function_arn` - The Amazon Resource Name (ARN) identifying
the Lambda function where log data optinally is forwarded to.
