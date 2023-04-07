terraform {
  backend "gcs" {
    bucket = "big-data-remote-state-dev-1337"
    prefix = "terraform/state"
  }
}