resource "aws_sns_topic" "aws_sns" {
  name = "sns_topic"
  display_name = 
  fifo_topic    = true
  content_based_deduplication = true
  kms_master_key_id 
  policy 
  delivery_policy
  kms_data_key_reuse_period_seconds = var.sns_kms_data_key_reuse_period_seconds
  application_success_feedback_role_arn = var.sns_application_success_feedback_role_arn
  application_success_feedback_sample_rate = var.sns_application_success_feedback_sample_rate
  application_failure_feedback_role_arn = var.sns_application_failure_feedback_role_arn
  application_failure_feedback_sample_rate = var.sns_application_failure_feedback_sample_rate
  http_success_feedback_role_arn = var.sns_http_success_feedback_role_arn
  http_success_feedback_sample_rate = var.sns_http_success_feedback_sample_rate
  http_failure_feedback_role_arn = var.sns_http_failure_feedback_role_arn
  http_failure_feedback_sample_rate = var.sns_http_failure_feedback_sample_rate
  tags                      = var.sns_tags
}

