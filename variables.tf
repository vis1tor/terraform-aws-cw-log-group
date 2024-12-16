################################################################################
# CloudWatch Log Group
################################################################################
variable "cw_log_group_info" {
  type = map(object({
    cw_log_group_name                       = string
    cw_log_group_retention_in_days          = string
    cw_log_group_class                      = string
    cw_log_group_kms_key_arn                = string
    cw_log_group_tags                       = map(string)
    cw_log_group_sub_filter_name            = string
    cw_log_group_sub_filter_role_arn        = string
    cw_log_group_sub_filter_pattern         = string
    cw_log_group_sub_filter_destination_arn = string
    cw_log_group_sub_filter_distribution    = string
  }))
}