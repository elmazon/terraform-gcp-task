###### ENABLING API ######

resource "google_project_service" "maaz" {
  project = "terraform-gcp-task"
  service = "compute.googleapis.com"

  timeouts {
    create = "30m"
    update = "40m"
  }

  disable_dependent_services = true
}


############ VPC ############
resource "google_compute_network" "vpc" {
  name = "nti-vpc"
  auto_create_subnetworks = false 
}

############ SUBNETS ############
resource "google_compute_subnetwork" "subnet1" {
  name          = "nti-subnet-1"
  ip_cidr_range = var.subnet-1-ip-cidr-range 
  region        = "europe-west1"
  network       = google_compute_network.vpc.id
}

resource "google_compute_subnetwork" "subnet2" {
  name          = "nti-subnet-2"
  ip_cidr_range = var.subnet-2-ip-cidr-range 
  region        = "us-central1"
  network       = google_compute_network.vpc.id
}

########### outputs ###########
/*output "subnet1_id" {
  value = google_compute_subnetwork.subnet1.id
}

output "subnet2_id" {
  value = google_compute_subnetwork.subnet2.id
}
*/