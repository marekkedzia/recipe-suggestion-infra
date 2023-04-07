resource "random_id" "bucket_prefix" {
  byte_length = 8
}

resource "google_storage_bucket" "storage_bucket" {
  name = "${var.name}-big-data-${random_id.bucket_prefix.hex}"
  location = var.location
  storage_class = var.class
}