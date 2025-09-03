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