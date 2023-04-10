resource "random_id" "bucket_prefix" {
  byte_length = 8
}

resource "google_storage_bucket" "pdf_storage_bucket" {
  name     = "${var.name}-dev-${random_id.bucket_prefix.hex}"
  location = var.location
}
