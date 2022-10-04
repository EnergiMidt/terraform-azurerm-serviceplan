locals {
  # name = "${var.name}${var.environment}"
  name     = var.override_name == null ? var.name : var.override_name
  location = var.override_location == null ? var.resource_group.location : var.override_location
}

resource "azurerm_service_plan" "service_plan" {
  name                = local.name
  location            = local.location
  resource_group_name = var.resource_group.name

  os_type                      = var.os_type
  sku_name                     = var.sku_name
  app_service_environment_id   = var.app_service_environment_id
  maximum_elastic_worker_count = var.maximum_elastic_worker_count
  worker_count                 = var.worker_count
  per_site_scaling_enabled     = var.per_site_scaling_enabled
  zone_balancing_enabled       = var.zone_balancing_enabled

  tags = var.tags
}
