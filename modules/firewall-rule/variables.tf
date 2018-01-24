variable "rule_name" {
  description = "Meaningful (and unique) name to describe what we're allowing"
}

variable "resource_group_name" {
  description = "Name of the resource group to place the rule into. MUST be the same asthe DB server"
}

variable "postgres_server_name" {
  description = "Name of the postgres server to apply this rule to"
}

variable "start_ip_address" {
  description = "start IP of the range to allow (use same for start and end if a single IP"
}

variable "end_ip_address" {
  description = "start IP of the range to allow (use same for start and end if a single IP"
}
