variable "database_name" {
  description = "Name of the Postgres database to manage/create"
}

variable "resource_group_name" {
  description = "Name of the resource group in which to create the DB (NB: Must be same as the DB server"
}

variable "postgres_server_name" {
  description = "Name of the Azure Database for PostgreSQL resource this DB will be created on"
}

variable "db_default_charset" {
  description = "Character set of the DB.  Defaults to UTF8"
  default     = "UTF8"
}

variable "db_collation" {
  description = "Collation for the DB (Defaults to 'English_United Kingdom.1252')"
  default     = "English_United Kingdom.1252"
}
