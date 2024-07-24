#################################
# CloudWatch Log Group
#################################
resource "aws_cloudwatch_log_group" "this" {
  for_each = var.cw_log_group_info

  name              = each.value.cw_log_group_name
  retention_in_days = each.value.cw_log_group_retention_in_days
  log_group_class   = each.value.cw_log_group_class
  kms_key_id        = each.value.cw_log_group_kms_key_arn

  tags = each.value.cw_log_group_tags
}
