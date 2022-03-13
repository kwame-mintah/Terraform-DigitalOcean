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