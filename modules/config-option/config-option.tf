resource "azurerm_postgresql_configuration" "postgresql_config_option" {
  name                = "${var.option_name}"
  value               = "${var.option_value}"
  server_name         = "${var.postgres_server_name}"
  resource_group_name = "${var.resource_group_name}"
}