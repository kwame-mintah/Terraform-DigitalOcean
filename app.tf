# To create a static DigitalOcean app
resource "digitalocean_app" "static_site_app" {
  spec {
    name   = "${local.enviornment}-static-site-app"
    region = "lon1"

    alert {
      rule = "DEPLOYMENT_FAILED"
    }

    static_site {
      name             = "digital-ocean-static-app"
      environment_slug = "html"

      github {
        repo           = "kwame-mintah/digitalocean-static-app"
        branch         = "master"
        deploy_on_push = var.deploy_on_push_static_app
      }

      routes {
        path = "/"
      }
    }
  }
}

# DigitalOcean App must follow a RegEx, therefore we must convert
# the environment name to lower case e.g. Dev -> dev
locals {
  enviornment = lower(var.environment)
}