variable "project_id" {
    default = "emerald-spring-465406-s1"
    type = string
}

# # variable "vm_name" {
# #     #default = "terraform-vm"
# #     type = string
# # }

# # variable "machine_type" {
# #     #default = "e2-medium"
# #     type = string
# # }

# variable "network" {
#     default = "sai-vpc"
#     type = string
# }

# variable "subnetwork" {
#     default = "sai-subnet"
#     type = string
# }

# variable "firewall" {
#     default = "firewall-allow"
#     type = string
# }

# # #map(string)
variable "environment" {
    type = string
    default = "dev"
 }

variable "machine_types" {
    type = map(string)
    default = {
      "dev" = "e2-medium"
      "test" = "e2-micro"
      "stage" = "e2-small"
      "prod" = "n1-standard"
    }
}

  
# # }

# # #object
# # variable "vm_config" {
# #     type = object({
# #       name = string
# #       machine_type = string
# #       count = number
# #       tags = list(string)
# #     })
# #     default = {
# #       name = "sai-vm"
# #       machine_type = "e2-medium"
# #       count = 4
# #       tags = [ "sai-vm1dk","sai-hsjks" ]
# #     }
  
# # }


#list(objects)
# variable "vm_list" {
#     type = list(object({
#       name = string
#       machine_type = string
#       network = string
#       subnetwork = string
#       firewall = string
#     }))
  #   default = [ {

  #  name = "sai-vm"
  #  machine_type = "e2-medium"
  #  network = "v-vpc"
  #  subnetwork = "subnet2"
  #  firewall = "allow-all"

  #   } ]
#}



variable "env" {
    type = string
    validation {
      condition = contains(["dev","stage","prod"], var.env)
      error_message = "Environment must be either : dev,test,prod"
    }
  
}


variable "location" {
    type = string
    validation {
      condition = contains(["us-central1","us-west4","us-east4"], var.location)
      error_message = "Environment must be either : us-east4,us-west4,us-central1"
    }
  
}
