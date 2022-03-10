# Create a new Web Droplet in the lon1 region
# Terraform destroy first then create
resource "digitalocean_droplet" "droplet" {
  count    = var.droplet_count
  image    = "ubuntu-20-04-x64"
  name     = "terraform-${var.region}-${count.index + 1}"
  region   = var.region
  size     = "s-1vcpu-1gb"
  ssh_keys = [data.digitalocean_ssh_key.personal_ssh_key.id]

  # ensures that we create the new resource before we destroy the old one
  # https://www.terraform.io/docs/configuration/resources.html#lifecycle-lifecycle-customizations
  lifecycle {
    create_before_destroy = true
  }
}
