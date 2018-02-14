resource "null_resource" "start" {
  provisioner "local-exec" {
    command = "echo depends_id=${var.depends_id}"
  }
}

resource "null_resource" "cloud_platform" {
  provisioner "local-exec" {
    # kontena platform name can not be reused after delete for about 1 min
    # terraform bug https://github.com/terraform-providers/terraform-provider-null/issues/12
    command = "for i in `seq 1 6`; do kontena cloud platform create --organization ${var.organization} --type ${var.type} --region ${var.region} --initial-size ${var.initial_size} ${var.name} && break; sleep 20; done"
  }

  provisioner "local-exec" {
    when    = "destroy"
    command = "kontena cloud platform rm --force ${var.organization}/${var.name}"
  }

  # when running at the same time, it's possible that the master is not removed https://github.com/kontena/kontena/issues/3239
  provisioner "local-exec" {
    when    = "destroy"
    command = "kontena master rm --force ${var.organization}/${var.name} || true"
  }
}

module "grid-outputs" {
  source  = "matti/grid-outputs/kontena"
  version = "0.0.2"

  depends_id   = "${null_resource.cloud_platform.id}"
  organization = "${var.organization}"
  name         = "${var.name}"
}
