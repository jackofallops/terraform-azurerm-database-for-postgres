resource "azurerm_postgresql_firewall_rule" "postgres_firewall_rule" {
  name                = "${var.rule_name}"
  resource_group_name = "${var.resource_group_name}"
  server_name         = "${var.postgres_server_name}"
  start_ip_address    = "${var.start_ip_address}"
  end_ip_address      = "${var.end_ip_address}"
}