resource "google_project_service" "app_engine" {
  service = "appengine.googleapis.com"
}

resource "google_project_service" "app_engine_iam" {
  service = "iam.googleapis.com"
}

resource "google_app_engine_application" "app" {
  location_id = var.location
  depends_on  = [google_project_service.app_engine]
}

data "google_app_engine_default_service_account" "app_engine_service_account" {
  depends_on = [google_project_service.app_engine_iam]
}