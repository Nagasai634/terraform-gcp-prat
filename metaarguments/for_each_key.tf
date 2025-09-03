# provider "google" {
#     project = "emerald-spring-465406-s1"
#     region = "us-central1"
# }


# variable "vm_names" {
#     type = list(string)
#     default = [ "nagasai1","nagasai2" ]
  
# }

# resource "google_compute_instance" "tf_name1" {
#     for_each = toset(var.vm_names)
#     name = each.key
#     machine_type = "e2-medium"
#     zone = "us-central1-f"
#     boot_disk {
#       initialize_params {
#         image = "debian-12"
#       }
#     }
#     network_interface {
#         network = "default"
#       access_config {
        
#       }
#     }
  
# }




resource "google_compute_instance" "example" {
  for_each = {
    "web-server" = "e2-medium"
    "app-server" = "e2-standard-2"
    "db-server"  = "e2-standard-4"
  }

  name         = each.key
  machine_type = each.value
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }
}