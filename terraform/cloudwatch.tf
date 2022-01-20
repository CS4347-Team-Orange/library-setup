resource "aws_sns_topic" "alerts" {
  name = "${local.app_name}-alerts"
}

resource "aws_sns_topic_subscription" "alerts_subscription" {
  topic_arn = aws_sns_topic.alerts.arn
  protocol  = "email"
  endpoint  = "${var.alert_email}"
}