resource "azurerm_postgresql_configuration" "postgresql_config_option_list" {
  name                = "${element(keys(var.option_map), count.index)}"
  value               = "${element(values(var.option_map), count.index)}"
  server_name         = "${var.postgres_server_name}"
  resource_group_name = "${var.resource_group_name}"

  count               = "${length(var.option_map)}"

}