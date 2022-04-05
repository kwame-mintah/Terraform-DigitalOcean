# Load balancer must be in the same region as the droplets
# Rules created will forward inbound http traffic on port 80
# to the port 80 on the droplet.
resource "digitalocean_loadbalancer" "droplet" {
  name        = "terraform-${var.region}-${var.environment}"
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
