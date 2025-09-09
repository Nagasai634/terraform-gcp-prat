provider "google" {
    project = var.project_id
    region = var.location
  
}


# resource "google_compute_instance" "tf_vm1" {
#     name = var.env
#     zone = "us-central1-c"
#     machine_type = var.machine_types[var.environment]
#     boot_disk {
#       initialize_params {
#         image = "debian-12"
#       }
#     }
#     network_interface {
#         network = google_compute_network.tf_net1.id
#         subnetwork = google_compute_subnetwork.tf-subnet2.id
#       access_config {
        
#       }
#     }
#     metadata_startup_script = file("${path.module}/startup.sh")
  
# }

# resource "google_compute_network" "tf_net1" {
#     name = var.network
#     auto_create_subnetworks = false
# }

# resource "google_compute_subnetwork" "tf-subnet1" {
#     name = var.subnetwork
#     network = google_compute_network.tf_net1.id
#     region = "us-central1"
#     ip_cidr_range = "10.0.0.0/24"
# }

# resource "google_compute_firewall" "tf_fir" {
#     name = var.firewall
#     direction = "INGRESS"
#     network = google_compute_network.tf_net1.id
#     source_ranges = ["0.0.0.0/0"]
#     allow {
#       protocol = "tcp"  
#       ports = ["22","80"]
#     }
# }


# resource "google_compute_subnetwork" "tf-subnet2" {
#     name = "subnet-2"
#     network = google_compute_network.tf_net1.id
#     region = "us-central1"
#     ip_cidr_range = "10.0.2.0/24"
# }


