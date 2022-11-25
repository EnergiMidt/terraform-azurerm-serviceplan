variable "environment" {
  description = "(Required) The name of the environment."
  type        = string
  validation {
    condition = contains([
      "dev",
      "test",
      "prod",
    ], var.environment)
    error_message = "Possible values are dev, test, and prod."
  }
}

variable "system_short_name" {
  description = <<EOT
  (Required) Short abbreviation (to-three letters) of the system name that this resource belongs to (see naming convention guidelines).
  Will be part of the final name of the deployed resource.
  EOT
  type        = string
}

variable "app_name" {
  description = <<EOT
  (Required) Name of this resource within the system it belongs to (see naming convention guidelines).
  Will be part of the final name of the deployed resource.
  EOT
  type        = string
}

variable "override_name" {
  description = "(Optional) Override the name of the resource. Under normal circumstances, it should not be used."
  default     = null
  type        = string
}

variable "override_location" {
  description = "(Optional) Override the location of the resource. Under normal circumstances, it should not be used."
  default     = null
  type        = string
}

variable "resource_group" {
  description = "(Required) The resource group in which to create the resource."
  type        = any
}

# This `resource_group_name` variable is replaced by the use of `resource_group` variable.
# variable "resource_group_name" {
#   description = "(Required) The name of the resource group where the resource should exist. Changing this forces a new resource to be created."
#   type        = string
# }

# This `location` variable is replaced by the use of `resource_group` variable.
# variable "location" {
#   description = "(Required) The location where the resource should exist. Changing this forces a new resource to be created."
#   type        = string
# }

variable "os_type" {
  description = "(Required) The O/S type for the App Services to be hosted in this plan. Possible values include `Windows`, `Linux`, and `WindowsContainer`."
  type        = string
  validation {
    condition     = can(regex("^(Windows|Linux|WindowsContainer)$", var.os_type))
    error_message = "Possible values include `Windows`, `Linux`, and `WindowsContainer`."
  }
}

variable "sku_name" {
  description = "(Required) The SKU for the plan. Possible values include `B1`, `B2`, `B3`, `D1`, `F1`, `I1`, `I2`, `I3`, `I1v2`, `I2v2`, `I3v2`, `P1v2`, `P2v2`, `P3v2`, `P1v3`, `P2v3`, `P3v3`, `S1`, `S2`, `S3`, `SHARED`, `EP1`, `EP2`, `EP3`, `WS1`, `WS2`, `WS3`, and `Y1`."
  type        = string
  validation {
    condition     = can(regex("^(B1|B2|B3|D1|F1|I1|I2|I3|I1v2|I2v2|I3v2|P1v2|P2v2|P3v2|P1v3|P2v3|P3v3|S1|S2|S3|SHARED|EP1|EP2|EP3|WS1|WS2|WS3|Y1)$", var.sku_name))
    error_message = "Possible values include `B1`, `B2`, `B3`, `D1`, `F1`, `I1`, `I2`, `I3`, `I1v2`, `I2v2`, `I3v2`, `P1v2`, `P2v2`, `P3v2`, `P1v3`, `P2v3`, `P3v3`, `S1`, `S2`, `S3`, `SHARED`, `EP1`, `EP2`, `EP3`, `WS1`, `WS2`, `WS3`, and `Y1`."
  }
}

variable "app_service_environment_id" {
  description = "(Optional) The ID of the App Service Environment to create this Service Plan in."
  type        = string
  default     = null
}

variable "maximum_elastic_worker_count" {
  description = "(Optional) The maximum number of workers to use in an Elastic SKU Plan. Cannot be set unless using an Elastic SKU."
  type        = number
  default     = null
}

variable "worker_count" {
  description = "(Optional) The number of Workers (instances) to be allocated."
  type        = number
  default     = null
}

variable "per_site_scaling_enabled" {
  description = "(Optional) Should Per Site Scaling be enabled. Defaults to `false`."
  type        = bool
  default     = false
}

variable "zone_balancing_enabled" {
  description = "(Optional) Should the Service Plan balance across Availability Zones in the region. Defaults to `false`."
  type        = bool
  default     = false
}

variable "tags" {
  description = "(Optional) A mapping of tags to assign to the resource."
  default     = {}
  type        = map(string)
}
