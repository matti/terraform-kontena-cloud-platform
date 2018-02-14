output "id" {
  value = "${null_resource.cloud_platform.id}"
}

output "name" {
  value = "${module.grid-outputs.name}"
}

output "grid_token" {
  value = "${module.grid-outputs.token}"
}

output "master_uri_wss" {
  value = "${module.grid-outputs.uri}"
}

output "master_uri_https" {
  value = "${replace(module.grid-outputs.uri, "/^wss/", "https")}"
}
