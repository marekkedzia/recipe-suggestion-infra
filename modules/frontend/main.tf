resource "random_id" "bucket_prefix" {
  byte_length = 8
}

resource "google_storage_bucket" "frontend_bucket" {
  name     = "${var.name}-dev-${random_id.bucket_prefix.hex}"
  location = var.location
}

resource "google_storage_bucket_iam_binding" "frontend_access_configuration" {
  bucket = google_storage_bucket.frontend_bucket.name
  role   = "roles/storage.objectViewer"

  members = [
    "allUsers",
  ]
}
