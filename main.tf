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

##########################################
# CloudWatch Log Group Subscription Filter
##########################################
resource "aws_cloudwatch_log_subscription_filter" "this" {
  for_each = { for k, v in var.cw_log_group_info : v.cw_log_group_sub_filter_name => v if v.cw_log_group_sub_filter_name != "" }

  name            = each.value.cw_log_group_sub_filter_name
  role_arn        = try(each.value.cw_log_group_sub_filter_role_arn, null)
  log_group_name  = aws_cloudwatch_log_group.this[each.value.cw_log_group_name].name
  filter_pattern  = each.value.cw_log_group_sub_filter_pattern
  destination_arn = each.value.cw_log_group_sub_filter_destination_arn
  distribution    = each.value.cw_log_group_sub_filter_distribution
}