provider "google" {
  project     = var.project
  credentials = file("/keys/brim-lab.json")
  region      = var.region
}
