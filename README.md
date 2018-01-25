# terraform-azurerm-database-for-postgres
Terraform module for creation of a Azure Database for Postgres
Currently in Preview at time of writing, so only Basic and Standard supported

## Usage

This module will create an Azure Database for Postgres instance with basic, sensible small defaults with minimal settings supplied, e.g.:
```hcl-terraform
module "demo_db" {
  source            = "sjones-sot/database-for-postgres/azurerm"
  location          = "westeurope"
  service_name      = "testdb"
  db_admin_password = "Philae-p8iephoh~quaiRah7"
}
```
In an attempt to be helpful, the currently available configuration options that can be set are exported as an output with their default values as the output `config_options_map`
In a future version, this will be utilised to create fine-grained control of the config, but for now it's up to you :) 

## More complex Examples
```hcl-terraform
module "configured_db" {
  source            = "sjones-sot/database-for-postgres/azurerm"
  location          = "westeurope"
  service_name      = "testdb"
  db_admin_password = "Philae-p8iephoh~quaiRah7"
}

module "firewall_single_ip" {
  source = "./modules/firewall-rule"
  postgres_server_name = "${module.test_pgsql.server_name}"
  rule_name            = "test_rule"
  resource_group_name  = "${module.test_pgsql.resource_group_name}"
  start_ip_address     = "169.254.1.5"
  end_ip_address       = "169.254.1.5"
}

module "config_option" {
  source               = "./modules/config-option"
  option_name          = "array_nulls"
  option_value         = "OFF"
  postgres_server_name = "${module.test_pgsql.server_name}"
  resource_group_name  = "${module.test_pgsql.resource_group_name}"
}

module "multiple_options" {
  source = "./modules/config-option-list"
  resource_group_name  = "${module.test_pgsql.resource_group_name}"
  postgres_server_name = "${module.test_pgsql.server_name}"
  option_map           = {
    enable_bitmapscan = "OFF"
    enable_hashagg    = "OFF"
  }
}

module "additional_db" {
  source               = "./modules/database"
  resource_group_name  = "${module.test_pgsql.resource_group_name}"
  postgres_server_name = "${module.test_pgsql.server_name}"
  database_name        = "testdb"
}

```
An additional child module exists at `./modules/firewall-rule-list` for a more convenient way to add a list of single IP's to the allowed connections, e.g.:
```hcl-terraform
module "firewall_rule_list" {
  rule_name            = "extra_alloeed_hosts"
  postgres_server_name = "${module.test_pgsql.server_name}"
  resource_group_name  = "${module.test_pgsql.resource_group_name}"
  ip_address_list      = ["10.10.1.1","10.54.3.7","172.16.34.11"]
  
}
```

