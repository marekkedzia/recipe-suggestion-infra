terraform {
  backend "gcs" {
    bucket = "lister-remote-state-dev-1337"
    prefix = "terraform/state"
  }
}