# terraform-kontena-cloud-platform

See (test)[test] folder for usage example.

    module "my_platform" {
      source  = "matti/cloud-platform/kontena"

      organization = "${var.organization}"
      name         = "${var.name}"
      type         = "standard"
      region       = "eu-west-1"
      initial_size = 3
    }

    output "grid" {
      value = {
        name             = "${module.my_platform.name}"
        grid_token       = "${module.my_platform.grid_token}"
        master_uri_wss   = "${module.my_platform.master_uri_wss}"
        master_uri_https = "${module.my_platform.master_uri_https}"
      }
    }

## testing

Set `test/terraform.tfvars`

  $ while true; do sleep 0.5; terraform destroy -force; rm terraform.tfstate; terraform apply -auto-approve; done
