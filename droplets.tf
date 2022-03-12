# Create a new tag to be used on droplets
resource "digitalocean_tag" "tags" {
  name = terraform.workspace
}

# Create a new Web Droplet in the lon1 region
# Terraform destroy first then create
resource "digitalocean_droplet" "droplet" {
  count    = var.droplet_count
  image    = "ubuntu-20-04-x64"
  name     = "terraform-${var.region}-${count.index + 1}"
  region   = var.region
  size     = var.droplet_size
  ssh_keys = [data.digitalocean_ssh_key.personal_ssh_key.id]
  tags     = [digitalocean_tag.tags.id]

  # ensures that we create the new resource before we destroy the old one
  # https://www.terraform.io/docs/configuration/resources.html#lifecycle-lifecycle-customizations
  lifecycle {
    create_before_destroy = true
  }
}

# Load balancer must be in the same region as the droplets
# Rules created will forward inbound http traffic on port 80
# to the port 80 on the droplet.
resource "digitalocean_loadbalancer" "droplet" {
  name        = "terraform-${var.region}"
  region      = var.region
  droplet_ids = digitalocean_droplet.droplet.*.id

  forwarding_rule {
    entry_port     = 80
    entry_protocol = "https"

    target_port     = 80
    target_protocol = "http"
  }


  lifecycle {
    create_before_destroy = true
  }
}

# Create the A record for our DNS which
# will be the IPv4 address for our load balancer an error will be triggered 
# if domain name or record is not managed by your DigitalOcean account.
resource "digitalocean_record" "droplet" {
  domain = data.digitalocean_domain.droplet.name
  type   = "A"
  name   = var.region
  value  = digitalocean_loadbalancer.droplet.ip
  ttl    = 30
}
