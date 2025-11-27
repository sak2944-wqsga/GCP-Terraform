terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
}

provider "google" {
  project = "decent-digit-479008-d5"
  region  = "us-central1"
  zone    = "us-central1-a"
}

resource "google_compute_instance" "my_vm" {
  name         = "shubhs-test-vm"
  machine_type = "e2-micro"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }

  network_interface {
    network = "default"

    access_config {}  # Assigns an external IP
  }
}
