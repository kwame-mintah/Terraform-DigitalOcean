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

output "server_ipv4_address" {
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