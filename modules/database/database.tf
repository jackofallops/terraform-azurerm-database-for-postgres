resource "azurerm_postgresql_database" "postgresql_database" {
  name                = "${var.database_name}"
  resource_group_name = "${var.resource_group_name}"
  server_name         = "${var.postgres_server_name}"
  charset             = "${var.db_default_charset}"
  collation           = "${var.db_collation}"
}