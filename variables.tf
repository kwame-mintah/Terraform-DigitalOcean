variable "do_api_token" {
  description = <<-EOF
    Your digital ocean API Token required for changes
    Set environment variable `TF_VAR_do_api_token` with value.
    Or using -var="do_api_token=..." CLI option
EOF

  type = string
}

variable "environment" {
  description = <<-EOF
    The environment of the project's resources. The possible values 
    are: `Development`, `Staging`, `Production`.
EOF

  type = string
}

variable "region" {
  description = <<-EOF
    Specify the datacenter that the droplet will
    be located.
EOF

  type    = string
  default = "lon1"
}

variable "droplet_count" {
  description = <<-EOF
  The amount of droplets to be created
  in the specified region.
EOF

  type    = number
  default = 1
}

variable "droplet_size" {
  description = <<-EOF
  The droplet size.
  
EOF

  type    = string
  default = "s-1vcpu-1gb"
}