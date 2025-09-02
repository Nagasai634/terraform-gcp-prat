# variable "vm_names" {
#     type = list(string)
#     default = [ "nagasai1","nagasai2" ]
  
# }


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