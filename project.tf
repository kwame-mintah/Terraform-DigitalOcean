# Create a new project rather than using default. This will make it easier to organize 
# resources into groups.
resource "digitalocean_project" "project" {
  count       = var.droplet_count
  name        = var.environment
  description = "A project to represent resources for an environment."
  purpose     = "Project resources for ${var.environment}"
  environment = var.environment
  resources = [
    digitalocean_droplet.droplet[*].urn[0],
    digitalocean_loadbalancer.droplet.urn
  ]
}
# Create a new tag to be used on droplets
resource "digitalocean_tag" "tags" {
  name = var.environment
}
