variable "option_map" {
  description = "Map of the configuration options to set in the form \"option_name\"=\"option_value\""
  type        = "map"
  default     = {}
}

variable "resource_group_name" {
  description = "Name of the resource group this subnet will be a member of"
}

variable "postgres_server_name" {
  description = "Name of the postgres server"
}
