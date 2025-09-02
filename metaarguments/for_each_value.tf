# variable "subnets" {
#     type = map(object({
#       cidr_block = string
#       region = string
#     }))
#     default = {
#       "uscentral1" = {
#         cidr_block = "10.4.0.0/16"
#         region = "us-central1"
        
#       }
#       "us-west4" = {
#         cidr_block = "10.5.0.0/16"
#         region = "us-west4"
#       }
#     }
  
# }


# resource "google_compute_network" "tf_net" {
#     name = "sai-vpc"
#     auto_create_subnetworks = false
  
# }

# resource "google_compute_subnetwork" "tf_subnet" {
#     for_each = var.subnets
#     name = "sai-subnet-${each.key}"
#     network = google_compute_network.tf_net.id
#     region = each.value.region
#     ip_cidr_range = each.value.cidr_block
  
# }