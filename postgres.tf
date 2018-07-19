resource "azurerm_resource_group" "resource_group" {
  location = "${var.location}"
  name     = "${var.service_name}-${var.environment}-postgresql-rg"
  count    = "${var.resource_group_name == "" ? 1 : 0}"
}

resource "azurerm_postgresql_server" "postgresql_server" {
  name                = "${var.service_name}${var.environment}pgsql"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group_name == "" ? azurerm_resource_group.resource_group.name : var.resource_group_name}"

  sku {
    name     = "${var.azure_postgres_sku_tier == "GeneralPurpose" ? "GP" : var.azure_postgres_sku_tier == "Basic" ? "B" : "MO" }_${var.azure_postgres_sku_family}_${var.sku_compute_units}"
    tier     = "${var.azure_postgres_sku_tier}"
    capacity = "${var.sku_compute_units}"
    family   = "${var.azure_postgres_sku_family}"
  }

  administrator_login          = "${var.db_admin_username}"
  administrator_login_password = "${var.db_admin_password}"
  version                      = "${var.postgres_version}"
  ssl_enforcement              = "${var.enforce_ssl}"

  storage_profile {
    storage_mb            = "${var.db_disk_size_mb}"
    backup_retention_days = "${var.backup_retention_days}"
    geo_redundant_backup  = "${var.geo_redundant_backup}"
  }
}
