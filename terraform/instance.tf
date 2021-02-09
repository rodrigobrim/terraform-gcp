resource "google_compute_instance" "vm_instance" {
  depends_on = [time_sleep.wait_for_apis_by_2mins]
  name         = var.instance_name
  machine_type = var.instance_machine_type
  zone         = var.instance_zone

  boot_disk {
      initialize_params {
        image = var.instance_image
      }
    }

  network_interface {
      subnetwork = var.subnet_name
      access_config {
      }
    }

  service_account {
      scopes = ["storage-rw"]
    }

  allow_stopping_for_update = true
}
