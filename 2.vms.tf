###################### VMS ######################
############# BUILDING A PUBLIC VM #############
###### PUB VM IP ADDRESS ######
/*
resource "google_compute_address" "vm_pub_ip_address" {
  name = "vm-pub-address"
  address = "10.0.1.15"
  region = "europe-west1"
}
*/

###### PUB VM INSTANCE ######
resource "google_compute_instance" "pub-vm" {
    name         = "public-vm"
    machine_type = "e2-micro"
    zone         = "europe-west1-b"
    boot_disk {
        initialize_params {
            image = "debian-cloud/debian-9"
            type  = "pd-standard"
            size  =  10
        }
    }
    network_interface {
        network = "nti-vpc"
        network_ip = "10.132.1.15"
        subnetwork = google_compute_subnetwork.subnet1.name
        
/*
        access_config {
            nat_ip = google_compute_address.vm_pub_ip_address.address
        }
        */
    }
}

############# BUILDING A PRIVATE VM #############
resource "google_compute_address" "vm_prv_ip_address" {
  name = "vm-prv-address"
  subnetwork   = google_compute_subnetwork.subnet2.id
  address_type = "INTERNAL"
  address = "10.128.1.15"
  region = "us-central1"

}

###### PUB VM INSTANCE ######
resource "google_compute_instance" "prv-vm" {
    name         = "private-vm"
    machine_type = "e2-micro"
    zone         = "us-central1-a"
    boot_disk {
        initialize_params {
            image = "debian-cloud/debian-9"
            type  = "pd-standard"
            size  =  10            
        }
    }
    network_interface {
        network = "nti-vpc"
        network_ip = google_compute_address.vm_prv_ip_address.address
        subnetwork = google_compute_subnetwork.subnet2.name
/*
        access_config {
            nat_ip = google_compute_address.vm_prv_ip_address.address
        }
        */
    }
}