output "subnet_name" {
    value = google_compute_subnetwork.tf-subnet2.id
  
}

output "dev_external_ip" {
    value = google_compute_instance.tf_vm1.network_interface.0.access_config.0.nat_ip
  
}

output "prod_external_ip" {
    value = google_compute_instance.tf_vm2.network_interface.0.access_config.0.nat_ip
  
}