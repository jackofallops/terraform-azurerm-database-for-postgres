output "fqdn" {
  value = "${azurerm_postgresql_server.postgresql_server.fqdn}"
}

output "resource_group_name" {
  value = "${azurerm_postgresql_server.postgresql_server.resource_group_name}"
}

output "server_name" {
  value = "${azurerm_postgresql_server.postgresql_server.name}"
}

output "config_options_map" {
  value = "${local.config_option_defaults}"
}