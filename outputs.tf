output "project_resources" {
  description = <<-EOF
    Return resources assoicated to the project

EOF

  value = digitalocean_project.project.resources
}
output "account_status" {
  description = <<-EOF
    Return your digitalocean account status

EOF

  value = data.digitalocean_account.account_details.status
}

output "server_ipv4_addresses" {
  description = <<-EOF
    Return all droplet ipv4 addresses

EOF

  value = digitalocean_droplet.droplet.*.ipv4_address
}

output "loadbalancer" {
  description = <<-EOF
  Return the IP address of the load balancer.

EOF

  value = digitalocean_loadbalancer.droplet.ip
}

output "static_app_live_domain" {
  description = <<-EOF
  The live URL of the app.

EOF

  value = digitalocean_app.static_site_app.live_url
}

output "static_app_updated_at" {
  description = <<-EOF
  The date and time of when the app was 
  last updated.

EOF

  value = digitalocean_app.static_site_app.updated_at
}