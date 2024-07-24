################################################################################
# CloudWatch Log Group
################################################################################
variable "cw_log_group_info" {
  type = map(object({
    cw_log_group_name              = string
    cw_log_group_retention_in_days = string
    cw_log_group_class             = string
    cw_log_group_kms_key_arn       = string
    cw_log_group_tags              = map(string)
  }))
}
