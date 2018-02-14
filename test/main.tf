variable "organization1" {}

variable "organization2" {}

variable "name1" {}

variable "name2" {}

module "kontena_platform1" {
  source = ".."

  organization = "${var.organization1}"
  name         = "${var.name1}"
  type         = "standard"
  region       = "us-east-1"
  initial_size = 3
}

module "kontena_platform2" {
  source = ".."

  organization = "${var.organization2}"
  name         = "${var.name2}"
  type         = "standard"
  region       = "eu-west-1"
  initial_size = 3
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
