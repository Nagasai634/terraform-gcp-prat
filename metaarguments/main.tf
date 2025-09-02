provider "google" {
    project = "emerald-spring-465406-s1"
    region = "us-central1"
    credentials = file("terraform.json")
}

provider "google" {
    alias = "project_2"
    project = "peak-key-463905-i9"
    region = "us-central1"
    credentials = file("venkatcreds.json")
}

resource "google_compute_instance" "tf_vm12" {
    count = 2
    name = "sai-${count.index}"
    zone = "us-central1-a"
    machine_type = "e2-medium"
    boot_disk {
      initialize_params {
        image = "debian-12"
      }
    }
    network_interface {
    network = "default"
    access_config {
      
    }
    }
    metadata_startup_script = file("${path.module}/startup.sh")
  
}



resource "google_compute_instance" "tf_vm129" {
    count = 2
    name = "venkat-${count.index}"
    zone = "us-central1-a"
    machine_type = "e2-medium"
    boot_disk {
      initialize_params {
        image = "debian-12"
      }
    }
    network_interface {
    network = "default"
    access_config {
      
    }
    }
    metadata_startup_script = file("${path.module}/startup.sh")
    provider = google.project_2
  
}