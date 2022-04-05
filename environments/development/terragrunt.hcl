# Terragrunt will copy the Terraform files from the locations specified into this directory
terraform {
  source = "../.."
}

# These are inputs that need to be passed for the terragrunt configuration
inputs = {
  environment               = "Development"
  droplet_count             = 1
  deploy_on_push_static_app = true
}