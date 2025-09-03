# provider "google" {
#     project = var.project_id
#     region = "us-central1"
# }

# resource "google_service_account" "sai-service" {
#     account_id = var.service_account_id
#     display_name = "sai-service"
#   depends_on = [ 
#     null_resource.null
#   ]
# }

# variable "service_account_id" {
#     type = string
#     default = "sai-service-account"
  
# }

# variable "project_id" {
#     type = string
#     default = "emerald-spring-465406-s1"
  
# }


# resource "null_resource" "null" {
#     provisioner "local-exec" {
#         command = "echo 'simulating iam delay ...' && sleep 30 "
#     }
  
# }

# resource "google_compute_instance" "name" {
#     name = "sai1"
#     machine_type = "e2-medium"
#     zone = "us-central1-a"
#     boot_disk {
#       initialize_params {
#         image = "centos-stream-9"
#       }
#     }
#     network_interface {
#         network = "vpc-1"
#       access_config {
        
#       }
#     }
#     depends_on = [ google_compute_network.vpc ]
#     service_account {
#       #email = "service_account_id@project_id.iam.gserviceaccount.com"
#       email = "${var.service_account_id}@${var.project_id}.iam.gserviceaccount.com"
#       scopes = ["cloud-platform"]
#     }
#     depends_on = [
#         google_service_account.sai-service,
#         null_resource.null
#     ]

  
# }

# resource "google_compute_network" "vpc" {
#     name = "vpc-1"
#     auto_create_subnetworks = true
  
# }