# Configure the DigitalOcean Provider
provider "digitalocean" {
  token = var.do_api_token
}

# Data source to get my digital ocean account
# resouce name from docs, then the variable name
data "digitalocean_account" "account_details" {}

# Add my ssh key to droplet from Collective team
data "digitalocean_ssh_key" "personal_ssh_key" {
  name = "KMacOS14"
}

# Create DNS Record for droplets
# NOTE: You need to have a domain name registered and
# managed by DigitalOcean.
data "digitalocean_domain" "droplet" {
  name = "k-dev.space"
}