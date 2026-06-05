variable "vpc_config" {
  description = "To get the CIDR Block and Name of the VPC"
  type = object({
    cidr     = string
    vpc_name = string
  })

  validation {
    condition     = can(cidrnetmask(var.vpc_config.cidr))
    error_message = "Invalid CIDR Format - ${var.vpc_config.cidr}"
  }
}

variable "subnets" {
  description = "To get the CIDR and Availability Zone "
  type = map(object({
    cidr_subnet = string
    az          = string
    public = optional(bool, false)
  }))

  validation {

    condition     = alltrue([for config in var.subnets : can(cidrnetmask(config.cidr_subnet))])
    error_message = "Invalid CIDR Block"
  }

}
