# Terraform DigitalOcean

The main purpose of this repository is for me to play around with [Terraform](https://www.terraform.io/). And is the first of many repositories to created so that I can get familiar with the different providers available.

This project will focus on the [DigitalOcean](https://github.com/digitalocean/terraform-provider-digitalocean) provider.

## Development

### Dependencies
- terraform
- pre-commit
- terraform-docs this is required for `terraform_docs` hooks.

## Prerequisites
1. Have a [DigitalOcean](https://digitalocean.com) account. 
2. You will need create a DigitalOcean API token [follow instructions](https://www.digitalocean.com/docs/api/create-personal-access-token/).
3. Add an ssh-key to your account as per [instructions](https://docs.digitalocean.com/products/droplets/how-to/add-ssh-keys/to-account/).

## Usage

1. Create a new workspace `terraform workspace new dev`
2. Run a `terraform plan -var-file=regions.tfvars`
3. Review the plan and if as expected `terraform apply -var-file=regions.tfvars`
4. Check in DigitalOcean to ensure new droplets have been created.

Please note that `.tfstate` files are stored locally on your machine as no backend has been specified. If you would like to properly version control your state files, it is possible to use an S3 bucket to store these files. This will ensure anyone else other than you running a plan/apply will always be using the same state file.

### Pre-Commit hooks

Git hook scripts are very helpful for identifying simple issues before pushing any changes. Hooks will run on every commit automatically pointing out issues in the code e.g. trailing whitespace.

To help with the maintenance of these hooks, [pre-commit](https://pre-commit.com/) is used, along with [pre-commit-hooks](https://pre-commit.com/#install).

Please following [these instructions](https://pre-commit.com/#install) to install `pre-commit` locally and ensure that you have run `pre-commit install` to install the hooks for this project.

Additionally, once installed, the hooks can be updated to the latest available version with `pre-commit autoupdate`.

### Documentation Generation

Code formatting and documentation for `variables` and `outputs` is generated using [pre-commit-terraform](https://github.com/antonbabenko/pre-commit-terraform/releases) hooks that in turn uses [terraform-docs](https://github.com/terraform-docs/terraform-docs) that will insert/update documentation. The following markers have been added to the `README.md`:
```
<!-- {BEGINNING|END} OF PRE-COMMIT-TERRAFORM DOCS HOOK --->
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK --->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | = 1.1.7 |
| <a name="requirement_digitalocean"></a> [digitalocean](#requirement\_digitalocean) | = 2.18.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_digitalocean"></a> [digitalocean](#provider\_digitalocean) | 2.18.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [digitalocean_droplet.droplet](https://registry.terraform.io/providers/digitalocean/digitalocean/2.18.0/docs/resources/droplet) | resource |
| [digitalocean_loadbalancer.droplet](https://registry.terraform.io/providers/digitalocean/digitalocean/2.18.0/docs/resources/loadbalancer) | resource |
| [digitalocean_record.droplet](https://registry.terraform.io/providers/digitalocean/digitalocean/2.18.0/docs/resources/record) | resource |
| [digitalocean_tag.tags](https://registry.terraform.io/providers/digitalocean/digitalocean/2.18.0/docs/resources/tag) | resource |
| [digitalocean_account.account_details](https://registry.terraform.io/providers/digitalocean/digitalocean/2.18.0/docs/data-sources/account) | data source |
| [digitalocean_domain.droplet](https://registry.terraform.io/providers/digitalocean/digitalocean/2.18.0/docs/data-sources/domain) | data source |
| [digitalocean_ssh_key.personal_ssh_key](https://registry.terraform.io/providers/digitalocean/digitalocean/2.18.0/docs/data-sources/ssh_key) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_do_api_token"></a> [do\_api\_token](#input\_do\_api\_token) | Your digital ocean API Token required for changes<br>Set environment variable `TF_VAR_do_api_token` with value.<br>Or using -var="do\_api\_token=..." CLI option | `string` | n/a | yes |
| <a name="input_droplet_count"></a> [droplet\_count](#input\_droplet\_count) | The amount of droplets to be created<br>in the specified region. | `number` | `1` | no |
| <a name="input_droplet_size"></a> [droplet\_size](#input\_droplet\_size) | The droplet size. | `string` | `"s-1vcpu-1gb"` | no |
| <a name="input_region"></a> [region](#input\_region) | Specify the datacenter that the droplet will<br>be located. | `string` | `"lon1"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_droplet_limit"></a> [droplet\_limit](#output\_droplet\_limit) | Return the digital oceanaccount droplet limit |
| <a name="output_loadbalancer"></a> [loadbalancer](#output\_loadbalancer) | Return the IP address of the load balancer. |
| <a name="output_server_ipv4_address"></a> [server\_ipv4\_address](#output\_server\_ipv4\_address) | Return all droplet ipv4 addresses |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK --->
