variable "do_api_token" {
  description = <<-EOF
    (Required) Your digital ocean API Token required for changes
    Set environment variable `TF_VAR_do_api_token` with value.
    Or using -var="do_api_token=..." CLI option
EOF

  type = string
}

variable "region" {
  description = <<-EOF
    (Required) Specify the region that the droplet will
    be located. Default: London 1.
EOF

  type    = string
  default = "lon1"
}

variable "droplet_count" {
  description = <<-EOF
  (Optional) The amount of droplets to be created
  in the specified region. Default: 1.
EOF

  type    = number
  default = 1
}
