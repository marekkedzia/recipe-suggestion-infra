locals {
  project_id = "big-data-dev-382612"
}

terraform {
  extra_arguments "common_vars" {
    commands  = ["plan", "apply"]
    arguments = ["-var-file=terraform-dev.tfvars"]
  }
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
    provider "google" {
      project="${local.project_id}"
      region="us"
    }
    EOF
}