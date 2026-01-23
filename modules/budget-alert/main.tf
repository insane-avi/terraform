resource "aws_sns_topic" "budget_alerts" {
  name = "budget-alert-topic"
}

resource "aws_sns_topic_subscription" "email" {
  topic_arn = aws_sns_topic.budget_alerts.arn
  protocol  = "email"
  endpoint  = var.email_address
}

resource "aws_budgets_budget" "monthly_budget" {
  name         = var.budget_name
  budget_type = "COST"
  limit_amount = var.limit_amount
  limit_unit   = "USD"
  time_unit    = var.time_unit

  notification {
    comparison_operator = "GREATER_THAN"
    threshold           = var.threshold
    threshold_type      = "PERCENTAGE"
    notification_type   = "ACTUAL"

    subscriber {
      subscription_type = "SNS"
      address           = aws_sns_topic.budget_alerts.arn
    }
  }
}
