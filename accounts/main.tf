module "storage" {
  source = "../modules/cloud-storage"
  name   = "${local.project}-main-bucket"
}

module "app_engine" {
  source   = "../modules/app-engine"
  location = var.location
}

module "frontend" {
  source   = "../modules/frontend"
  location = var.location
  name     = "${local.project}-frontend-bucket"
}

module "pdf_storage" {
  source = "../modules/pdf-storage"
  name = "${local.project}-pdf-recipe-storage"
}