variable "organization" {}

variable "name_prefix" {}

variable "platform_version" {
  default = ""
}

module "kontena_platform1" {
  source = ".."

  organization     = "${var.organization}"
  name             = "${var.name_prefix}1"
  type             = "standard"
  region           = "us-east-1"
  platform_version = "${var.platform_version}"
  initial_size     = 3
}

module "kontena_platform2" {
  source = ".."

  organization     = "${var.organization}"
  name             = "${var.name_prefix}2"
  type             = "standard"
  region           = "eu-west-1"
  platform_version = "${var.platform_version}"
  initial_size     = 3
}

output "grid1" {
  value = {
    name             = "${module.kontena_platform1.name}"
    grid_token       = "${module.kontena_platform1.grid_token}"
    master_uri_wss   = "${module.kontena_platform1.master_uri_wss}"
    master_uri_https = "${module.kontena_platform1.master_uri_https}"
  }
}

output "grid2" {
  value = {
    name             = "${module.kontena_platform2.name}"
    grid_token       = "${module.kontena_platform2.grid_token}"
    master_uri_wss   = "${module.kontena_platform2.master_uri_wss}"
    master_uri_https = "${module.kontena_platform2.master_uri_https}"
  }
}
