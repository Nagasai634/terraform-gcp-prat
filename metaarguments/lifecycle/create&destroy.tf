# provider "google" {
#     project = "emerald-spring-465406-s1"
#     region = "us-central1"
# }

# resource "google_compute_instance" "vm1"{
#     name = "vm1"
#     zone = "us-central1-a"
#     #zone = "us-central1-b"
#     machine_type = "e2-medium"
#     boot_disk {
#         initialize_params {
#           image = "centos-stream-9"
#         }
#     }
#     network_interface {
#         network = "default"
#         access_config {

#         }
#     }
# //without lifecycle : -/+ destroy and then create replacement
# //with lifecycle(create_before_destroy) : +/- create replacement and then destroy
#     lifecycle {
#         create_before_destroy =true
#     }

# }