provider "google" {
  project = "emerald-spring-465406-s1"
  region  = "us-central1"
}

resource "google_compute_instance" "tf_vm1" {
  name         = var.vm_list[0].name
  zone         = "us-central1-c"
  machine_type = var.vm_list[0].machine_type # Fixed index [0]
  
  boot_disk {
    initialize_params {
      image = "debian-12"
    }
  }
  
  network_interface {
    network    = google_compute_network.tf_net1.id
    subnetwork = google_compute_subnetwork.tf-subnet2.id # Consistent with resource below
    access_config {}
  }
  
  metadata_startup_script = file("${path.module}/startup.sh")
}

resource "google_compute_network" "tf_net1" {
  name                    = var.vm_list[0].network # Fixed index [0]
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "tf-subnet2" {
  name          = var.vm_list[0].subnetwork # Fixed index [0]
  network       = google_compute_network.tf_net1.id
  region        = "us-central1"
  ip_cidr_range = "10.0.2.0/24"
}

resource "google_compute_firewall" "tf_fir" {
  name        = var.vm_list[0].firewall # Fixed index [0]
  direction   = "INGRESS"
  network     = google_compute_network.tf_net1.id
  source_ranges = ["0.0.0.0/0"]
  
  allow {
    protocol = "tcp"
    ports    = ["22", "80"]
  }
}



resource "google_compute_instance" "tf_vm2" {
  name         = var.vm_list[1].name
  zone         = "us-central1-f"
  machine_type = var.vm_list[1].machine_type # Fixed index [0]
  
  boot_disk {
    initialize_params {
      image = "debian-12"
    }
  }
  
  network_interface {
    network    = google_compute_network.tf_net2.id
    subnetwork = google_compute_subnetwork.tf-subnet3.id  # Consistent with resource below
    access_config {}
  }
  
  metadata_startup_script = file("${path.module}/startup.sh")
}

resource "google_compute_network" "tf_net2" {
  name                    = var.vm_list[1].network # Fixed index [0]
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "tf-subnet3" {
  name          = var.vm_list[1].subnetwork # Fixed index [0]
  network       = google_compute_network.tf_net2.id
  region        = "us-central1"
  ip_cidr_range = "10.0.6.0/24"
}

resource "google_compute_firewall" "tf_fir1" {
  name        = var.vm_list[1].firewall # Fixed index [0]
  direction   = "INGRESS"
  network     = google_compute_network.tf_net1.id
  source_ranges = ["0.0.0.0/0"]
  
  allow {
    protocol = "tcp"
    ports    = ["22", "80"]
  }
}
